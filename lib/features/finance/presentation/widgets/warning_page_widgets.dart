import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData? trailing;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F5F7),
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'SF Compact Display',
                color: Color(0xFF818181),
                letterSpacing: -0.4,
              ),
            ),
            if (trailing != null)
              Icon(trailing, size: 16.0, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F7),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: const Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Комментарий',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'SF Compact Display',
            color: Color(0xFF818181),
            letterSpacing: -0.4,
          ),
        ),
      ),
    );
  }
}




