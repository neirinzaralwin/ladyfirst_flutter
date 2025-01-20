import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget({super.key});

  @override
  State<HomeCategoriesWidget> createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  List<String> categories = [
    'All',
    'Shoes',
    'Dress',
    'Bags',
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: List.generate(4, (index) {
            return Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: ChoiceChip(
                label: Container(
                  constraints: BoxConstraints(minWidth: 30.0),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? AppColor.secondaryColor
                            : AppColor.grey,
                      ),
                    ),
                  ),
                ),
                showCheckmark: false,
                selected: _selectedIndex == index,
                selectedColor: AppColor.primaryColor,
                side: BorderSide(
                    color: AppColor.accentColor), // Change border color to gray
                onSelected: (bool selected) {
                  setState(() {
                    _selectedIndex = selected ? index : _selectedIndex;
                  });
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
