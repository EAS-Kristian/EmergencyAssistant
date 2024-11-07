import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../constants/colors.dart';
import 'resources_screen.dart';

class GuidanceScreen extends StatelessWidget {
  const GuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Health Guidance',
      ),
      body: const Center(
        child: Text('Guidance Content Coming Soon'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,  
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
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ResourcesScreen()),
            );
          }
        },
      ),
    );
  }
} 