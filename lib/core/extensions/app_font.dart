import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';

extension TextStyleExtensions on Text {
  Text get bold => copyWith(
      style: style?.copyWith(fontWeight: FontWeight.w600) ??
          const TextStyle(fontWeight: FontWeight.w600));

  // white color
  Text get white => copyWith(
      style: style?.copyWith(color: AppColor.white) ??
          const TextStyle(color: AppColor.white));

  Text get black => copyWith(
      style: style?.copyWith(color: AppColor.black) ??
          const TextStyle(color: AppColor.black));

  Text get primaryColor => copyWith(
      style: style?.copyWith(color: AppColor.primaryColor) ??
          const TextStyle(color: AppColor.primaryColor));

  Text get orangeColor => copyWith(
      style: style?.copyWith(color: AppColor.orangeColor) ??
          const TextStyle(color: AppColor.orangeColor));

  Text get greyColor => copyWith(
      style: style?.copyWith(color: AppColor.darkGray) ??
          const TextStyle(color: AppColor.darkGray));

  Text get secondaryColor => copyWith(
      style: style?.copyWith(color: AppColor.secondaryColor) ??
          const TextStyle(color: AppColor.secondaryColor));

  Text get redColor => copyWith(
      style: style?.copyWith(color: AppColor.redColor) ??
          const TextStyle(color: AppColor.redColor));

  Text get lightGrey => copyWith(
      style: style?.copyWith(color: AppColor.grey) ??
          const TextStyle(color: AppColor.grey));

  Text fontSize(double size) => copyWith(
      style: style?.copyWith(fontSize: size) ?? TextStyle(fontSize: size));

  Text get title => copyWith(
      style:
          style?.copyWith(fontSize: 24.0) ?? const TextStyle(fontSize: 24.0));

  Text get bodySmall => copyWith(
      style:
          style?.copyWith(fontSize: 12.0) ?? const TextStyle(fontSize: 12.0));

  Text get bodyMedium => copyWith(
      style:
          style?.copyWith(fontSize: 14.0) ?? const TextStyle(fontSize: 14.0));

  Text get bodyLarge => copyWith(
      style:
          style?.copyWith(fontSize: 16.0) ?? const TextStyle(fontSize: 16.0));

  Text get headSmall => copyWith(
      style:
          style?.copyWith(fontSize: 18.0) ?? const TextStyle(fontSize: 18.0));

  Text get headMedium => copyWith(
      style:
          style?.copyWith(fontSize: 20.0) ?? const TextStyle(fontSize: 20.0));

  Text get headLarge => copyWith(
      style:
          style?.copyWith(fontSize: 22.0) ?? const TextStyle(fontSize: 22.0));

  Text copyWith({TextStyle? style}) {
    return Text(
      data ?? '',
      style: this.style?.merge(style) ?? style,
      key: key,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
