import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/dimension/screen_dimension.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  final carouselHeight = 150.0;
  late CarouselSliderController carouselController; // Correct controller type
  int currentPage = 0;

  @override
  void initState() {
    carouselController =
        CarouselSliderController(); // Use the correct controller initialization
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenDimension.getWidth(context);

    return SliverToBoxAdapter(
      child: _innerBannerSlider(carouselHeight, screenWidth),
    );
  }

  Widget _innerBannerSlider(double height, double width) {
    return Column(
      children: [
        SizedBox(height: 15.0),
        SizedBox(
          height: height,
          width: width,
          child: SizedBox(
            child: CarouselSlider(
              carouselController: carouselController, // Attach the controller
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
              items: List.generate(5, (index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/300/200?random=$index',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) {
              bool isSelected = currentPage == index;
              return GestureDetector(
                onTap: () {
                  carouselController.animateToPage(index);
                },
                child: AnimatedContainer(
                  width: isSelected ? 44 : 13,
                  height: 7,
                  margin: EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primaryColor : AppColor.grey,
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
