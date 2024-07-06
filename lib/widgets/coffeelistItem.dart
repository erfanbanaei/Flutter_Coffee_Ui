import 'package:flutter/material.dart';
import 'package:coffeeapp/constants/constants.dart';

class CoffeeListItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CoffeeListItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Corange : Cdarkgray,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Corange,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
