import 'package:flutter/material.dart';
import 'package:whatsapp/features/app/theme/style.dart';

class SettingsItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsItemWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Icon(
              icon,
              color: greyColor,
              size: 35,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: TextStyle(fontSize: 14, color: Colors.white30),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "$description",
                  style: TextStyle(fontSize: 17, color: Colors.white60),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
