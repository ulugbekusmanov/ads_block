import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    Key? key,
    required this.pageViewIndex,
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.white,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  final int itemCount;
  final int pageViewIndex;

  final ValueChanged<int> onPageSelected;

  final Color color;

  // The increase in the size of the selected dot
  // The distance between the center of each dot
  static const double _kDotSpacing = 12.0;

  Widget _buildDot(int index) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
          width: _kDotSpacing,
          child: Container(

            decoration: BoxDecoration(
              color: pageViewIndex == index ? Colors.black : Colors.white,
              border: Border.all(
                color: Colors.black,
              ),
              shape: BoxShape.circle,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
