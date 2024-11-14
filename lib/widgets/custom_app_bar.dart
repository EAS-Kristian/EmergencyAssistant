import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/location_provider.dart';

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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
          Padding(
            padding: const EdgeInsets.only(left: 32.0), 
            child: Consumer<LocationProvider>(
              builder: (context, locationProvider, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    if (locationProvider.isLoading)
                      const Text(
                        'Getting location...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    else if (locationProvider.currentPosition == null)
                      const Text(
                        'No Location',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    else
                      Text(
                        '${locationProvider.currentPosition!.latitude.toStringAsFixed(4)}, '
                        '${locationProvider.currentPosition!.longitude.toStringAsFixed(4)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => locationProvider.updateLocation(),
                      child: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                );
              },
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