import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../constants/colors.dart';
import 'guidance_screen.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Resources',
      ),
      body: const Center(
        child: Text('Resources Content Coming Soon'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Guidance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Resources',
          ),
        ],
        selectedItemColor: AppColors.medicalGreen,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const GuidanceScreen()),
            );
          }
        },
      ),
    );
  }
} 