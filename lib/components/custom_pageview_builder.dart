import 'package:flutter/material.dart';

class CustomPageViewBuilder extends StatelessWidget {

  final PageController? pageController;
  final int itemCount;
  final ValueChanged<int>? onPageValueChange;
  final ScrollPhysics? scrollPhysics;
  final Axis scrollDirection;
  final NullableIndexedWidgetBuilder builder;
  
  const CustomPageViewBuilder({
    super.key,
    required this.itemCount,
    this.pageController,
    this.onPageValueChange,
    this.scrollPhysics,
    this.scrollDirection = Axis.horizontal,
    required this.builder
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      allowImplicitScrolling: true,
      controller: pageController,
      itemCount: itemCount,
      onPageChanged: onPageValueChange,
      padEnds: true,
      pageSnapping: true,
      physics: scrollPhysics,
      scrollDirection: scrollDirection,
      itemBuilder: builder,
    );
  }
}