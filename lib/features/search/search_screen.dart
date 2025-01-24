import 'package:flutter/material.dart';
import 'widgets/search_app_bar.dart';
import 'widgets/search_result_header.dart';
import 'widgets/search_result_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchAppBar(),
          SearchResultHeader(),
          SearchResultWidget(),
        ],
      ),
    );
  }
}
