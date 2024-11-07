import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key, 
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.medicalGreen,
      elevation: 0,
      centerTitle: false,
      title: Row(
        children: [
          const Icon(
            Icons.medical_services,  
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 8),  
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
          onPressed: () {

          },
        ),
      ],
    );
  }
} 