import 'package:flutter/material.dart';


class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;


    return SizedBox.expand(
      child: Stack(
        children: [     
          Positioned(child: Container(color: backgroundColor)),
          child,
        ],
      ),
    );
  }
}
