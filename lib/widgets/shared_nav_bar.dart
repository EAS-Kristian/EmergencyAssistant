import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/home_screen.dart';
import '../screens/guidance_screen.dart';
import '../screens/resources_screen.dart';

class SharedNavBar extends StatelessWidget {
  final int currentIndex; 

  const SharedNavBar({
    super.key,
    required this.currentIndex, 
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, 
      
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

        if (index == currentIndex) return;
        
        switch (index) {
          case 0: 
            Navigator.pushAndRemoveUntil( 
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,  
            );
            break;
          case 1:  
            Navigator.pushReplacement(  
              context,
              MaterialPageRoute(builder: (context) => const GuidanceScreen()),
            );
            break;
          case 2: 
            Navigator.pushReplacement( 
              context,
              MaterialPageRoute(builder: (context) => const ResourcesScreen()),
            );
            break;
        }
      },
    );
  }
}