import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/home/presentation/views/widgets/custom_navigation_bar.dart';

class Layout extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const Layout({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        bottomNavigationBar:
            CustomBottomNavigationBar(navigationShell: widget.navigationShell),
        body: BranchContainer(
          key: ValueKey<int>(widget.navigationShell.currentIndex),
          currentIndex: widget.navigationShell.currentIndex,
          children: widget.children,
        ),
      ),
    );
  }
}

class BranchContainer extends StatelessWidget {
  const BranchContainer(
      {super.key, required this.currentIndex, required this.children});

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: children,
    );
  }
}
