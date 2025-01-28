import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/constants/app_color.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';
import 'package:lady_first_flutter/widgets/image/custom_cached_network_image.dart';

class Product {
  final int id;
  final String title;
  final String subTitle;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.imageUrl,
  });
}

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final Set<int> _selectedIndices = {};
  final List<Product> _products = [
    Product(
      id: 0,
      title: 'Premium Wireless Headphones',
      subTitle: 'Black',
      price: 149.99,
      imageUrl: 'https://picsum.photos/200/300?random=1',
    ),
    Product(
      id: 1,
      title: 'Smart Fitness Tracker',
      subTitle: 'Black',
      price: 79.99,
      imageUrl: 'https://picsum.photos/200/300?random=2',
    ),
  ];

  void _toggleItem(int index) {
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        _selectedIndices.add(index);
      }
    });
  }

  void _toggleSelectAll() {
    setState(() {
      if (_selectedIndices.length == _products.length) {
        _selectedIndices.clear();
      } else {
        _selectedIndices
            .addAll(List.generate(_products.length, (index) => index));
      }
    });
  }

  void _clearAll() {
    setState(() {
      _products.clear();
      _selectedIndices.clear();
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    final product = _products[index];
    final isSelected = _selectedIndices.contains(index);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppColor.primaryColor : AppColor.mildGray,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12.5),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: InkWell(
        onTap: () => _toggleItem(index),
        child: Row(
          children: [
            CustomCachedNetworkImage(
              imageUrl: product.imageUrl,
              width: 80.0,
              height: 100.0,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(10.0),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ).bodyMedium.bold,
                  const SizedBox(height: 4),
                  Text(
                    product.subTitle,
                  ).bodyMedium.greyColor,
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                  ).bodyMedium.bold.primaryColor,
                ],
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: (_) => _toggleItem(index),
              activeColor: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'No items in wishlist',
      ).bodyMedium.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        leading: TextButton(
          onPressed: _products.isNotEmpty ? _toggleSelectAll : null,
          child: Text(
            _selectedIndices.length == _products.length
                ? "Deselect all"
                : "Select all",
          ).primaryColor,
        ),
        leadingWidth: 100.0,
        actions: [
          TextButton(
            onPressed: _products.isNotEmpty ? _clearAll : null,
            child: const Text("Clear").primaryColor,
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _products.isNotEmpty
            ? CustomScrollView(
                key: const ValueKey('has_items'),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildListItem(context, index),
                      childCount: _products.length,
                    ),
                  ),
                ],
              )
            : _buildEmptyState(),
      ),
    );
  }
}
