import 'package:flutter/material.dart';
import 'package:paysen/config/app_utils.dart';

class CustomListviewBuilder<T> extends StatelessWidget {

  final List<T> listOfItems;
  final ScrollPhysics? scrollPhysics;
  final Axis scrollDirection; 
  final CustomListItemBuilder<T> customListItemBuilder;

  const CustomListviewBuilder({
    super.key,
    required this.listOfItems,
    this.scrollPhysics,
    this.scrollDirection = Axis.vertical,
    required this.customListItemBuilder
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfItems.length,
      physics: scrollPhysics,
      padding: EdgeInsets.zero,
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return customListItemBuilder(context, index, listOfItems[index]);
      },
    );
  }
}