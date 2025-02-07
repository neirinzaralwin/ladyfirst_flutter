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
  bool _isRealPull = false;
  bool _isLoading = false; // Add this

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2500), // Increased duration
      vsync: this,
    );

    _colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.green.withOpacity(0.3),
          end: AppColor.orangeColor.withOpacity(0.3),
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: AppColor.orangeColor.withOpacity(0.3),
          end: Colors.green.withOpacity(0.3),
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
    if (!_isLoading) {
      setState(() => _isPulling = false);
      _glowController.stop();
    }
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
        if (notification is ScrollStartNotification) {
          _isRealPull = notification.dragDetails != null;
        } else if (notification is ScrollUpdateNotification) {
          if (notification.metrics.pixels < 0 && _isRealPull) {
            if (!_isPulling && _isLoading) {
              // Only show when loading
              setState(() => _isPulling = true);
              _glowController.repeat(reverse: true);
            }
          } else {
            if (_isPulling && !_isLoading) {
              _stopGlowWithFade();
            }
          }
        } else if (notification is ScrollEndNotification) {
          _isRealPull = false;
          if (_isPulling && !_isLoading) {
            _stopGlowWithFade();
          }
        }
        return false;
      },
      child: Stack(
        children: [
          CustomRefreshIndicator(
            onRefresh: () async {
              setState(() {
                _isLoading = true;
                _isPulling = true;
              });
              _glowController.repeat(reverse: true);

              await widget.onRefresh();

              setState(() {
                _isLoading = false;
                _isPulling = false;
              });
              _glowController.stop();
            },
            trigger: IndicatorTrigger.leadingEdge,
            child: widget.child,
            offsetToArmed: 40.0,
            builder: (context, child, controller) {
              return Stack(
                children: [
                  // Main content
                  Transform.translate(
                    offset: Offset(0.0, controller.value * 40.0),
                    child: child,
                  ),

                  // Loading Indicator
                  if (controller.value > 0)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 40.0 * controller.value, // Reduced height
                        child: Center(
                          child: SizedBox(
                            height: 25, // Slightly reduced size
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

                  // Glow Effect
                  if (_isPulling && _isLoading) // Only show glow when loading
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AnimatedBuilder(
                        animation: _colorAnimation,
                        builder: (context, child) {
                          return Container(
                            height: 100, // Reduced height
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
          ),
        ],
      ),
    );
  }
}
