import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isCircle;
  final BorderRadius? borderRadius;

  const CustomCachedNetworkImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.isCircle = false,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = (imageUrl.isEmpty)
        ? Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/place_holder.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: isCircle ? null : borderRadius,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: AppColor.mildGray,
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.mashauri.org/wp-content/uploads/2020/10/no-image.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            fadeInDuration: const Duration(milliseconds: 300),
            maxHeightDiskCache: height != null ? (height! * 2).toInt() : null,
            maxWidthDiskCache: width != null ? (width! * 2).toInt() : null,
            memCacheHeight: height != null ? (height! * 2).toInt() : null,
            memCacheWidth: width != null ? (width! * 2).toInt() : null,
          );

    if (isCircle) {
      imageWidget = ClipOval(child: imageWidget);
    } else if (borderRadius != null) {
      imageWidget = ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: imageWidget,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: imageWidget,
    );
  }
}
