import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

class InspiringRefreshIndicator extends StatefulWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const InspiringRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  State<InspiringRefreshIndicator> createState() =>
      _InspiringRefreshIndicatorState();
}

class _InspiringRefreshIndicatorState extends State<InspiringRefreshIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<Color?> _colorAnimation;
  bool _isPulling = false;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green.withValues(alpha: 0.3),
          end: AppColor.orangeColor.withValues(alpha: 0.3),
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: AppColor.orangeColor.withValues(alpha: 0.3),
          end: Colors.green.withValues(alpha: 0.3),
        ),
      ),
    ]).animate(_glowController);

    _glowController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _glowController.reverse();
      } else if (status == AnimationStatus.dismissed && _isPulling) {
        _glowController.forward();
      }
    });
  }

  void _stopGlowWithFade() async {
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => _isPulling = false);
    _glowController.stop();
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          if (notification.metrics.pixels < 0) {
            if (!_isPulling) {
              setState(() => _isPulling = true);
              _glowController.repeat(reverse: true);
            }
          } else {
            if (_isPulling) {
              _stopGlowWithFade();
            }
          }
        }
        return false;
      },
      child: Stack(
        children: [
          CustomRefreshIndicator(
            onRefresh: widget.onRefresh,
            trigger: IndicatorTrigger.leadingEdge,
            offsetToArmed: 30.0,
            builder: (context, child, controller) {
              return Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0.0, controller.value * 35.0),
                    child: child,
                  ),
                  if (controller.value > 0)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 40.0 * controller.value,
                        child: Center(
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: controller.isLoading
                                ? const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColor.primaryColor,
                                    ),
                                  )
                                : Transform.scale(
                                    scale: controller.value,
                                    child: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  if (_isPulling)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AnimatedBuilder(
                        animation: _colorAnimation,
                        builder: (context, child) {
                          return Container(
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  _colorAnimation.value ?? Colors.transparent,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
            },
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
