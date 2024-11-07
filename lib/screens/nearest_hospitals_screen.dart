import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../constants/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class NearestHospitalsScreen extends StatelessWidget {
  const NearestHospitalsScreen({super.key});

  Future<void> _openInMaps(double lat, double lng, String name) async {
    final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Could not launch maps: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Nearest Hospitals',
      ),
      body: FutureBuilder<Position>(
        future: Geolocator.getCurrentPosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 5, 
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(
                    Icons.local_hospital,
                    color: AppColors.medicalGreen,
                    size: 28,
                  ),
                  title: Text(
                    'Hospital ${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text('2.5 km away'),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.directions,
                      color: AppColors.medicalGreen,
                    ),
                    onPressed: () {

                      _openInMaps(51.5074, -0.1278, 'Hospital ${index + 1}');
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
} 