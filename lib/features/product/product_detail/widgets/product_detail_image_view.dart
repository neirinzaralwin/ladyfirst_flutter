import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class ProductDetailImageView extends StatefulWidget {
  final List<String> images;
  const ProductDetailImageView({super.key, required this.images});

  @override
  State<ProductDetailImageView> createState() => _ProductDetailImageViewState();
}

class _ProductDetailImageViewState extends State<ProductDetailImageView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: ScreenDimension.getWidth(context),
          height: ScreenDimension.getWidth(context),
          decoration: BoxDecoration(
            color: AppColor.black,
          ),
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                widget.images[index],
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        Positioned(
            left: 20.0,
            top: 20.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "${_currentIndex + 1}/${widget.images.length}",
              ).bodySmall.white,
            )),
      ],
    );
  }
}
