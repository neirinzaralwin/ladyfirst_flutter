import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';

class ProductLoadingGridView extends StatelessWidget {
  final int childCount;

  const ProductLoadingGridView({
    super.key,
    this.childCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.accentColor2,
                    border: Border.all(width: 0.5, color: AppColor.accentColor),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image placeholder
                        Expanded(
                          child: Container(
                            color: AppColor.white,
                          ),
                        ),
                        // Text placeholders
                        Container(
                          height: 80,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 16,
                                color: AppColor.white,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 80,
                                height: 12,
                                color: AppColor.white,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 60,
                                height: 14,
                                color: AppColor.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: childCount, // Use the parameter here
        ),
      ),
    );
  }
}
