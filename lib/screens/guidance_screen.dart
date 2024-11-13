import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'home_screen.dart';
import 'resources_screen.dart';
import '../widgets/shared_nav_bar.dart';
import '../widgets/custom_app_bar.dart';

class GuidanceScreen extends StatelessWidget {
  const GuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Guidance',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Emergency Services',
              icon: Icons.emergency,
              children: [
                _buildServiceTile(
                  icon: Icons.phone,
                  title: 'Emergency - 999',
                  subtitle: 'For life-threatening emergencies',
                  color: Colors.red,
                  onTap: () {
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _buildSection(
              title: 'Non-Emergency Services',
              icon: Icons.local_hospital,
              children: [
                _buildServiceTile(
                  icon: Icons.healing,
                  title: 'NHS 111',
                  subtitle: 'Get medical help or advice',
                  color: AppColors.medicalGreen,
                  onTap: () {
                  },
                ),
                _buildServiceTile(
                  icon: Icons.local_pharmacy,
                  title: 'Find a Pharmacy',
                  subtitle: 'Locate nearest open pharmacy',
                  color: AppColors.medicalGreen,
                  onTap: () {
                  },
                ),
                _buildServiceTile(
                  icon: Icons.medical_services,
                  title: 'GP Services',
                  subtitle: 'Find or contact your GP',
                  color: AppColors.medicalGreen,
                  onTap: () {
                  },
                ),
                _buildServiceTile(
                  icon: Icons.local_hospital,
                  title: 'Walk-in Centres',
                  subtitle: 'Find nearest walk-in centre',
                  color: AppColors.medicalGreen,
                  onTap: () {
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _buildSection(
              title: 'Health Information',
              icon: Icons.info_outline,
              children: [
                _buildServiceTile(
                  icon: Icons.health_and_safety,
                  title: 'NHS Health A-Z',
                  subtitle: 'Conditions and treatments',
                  color: Colors.blue,
                  onTap: () {
                  },
                ),
                _buildServiceTile(
                  icon: Icons.medication,
                  title: 'Medicines Guide',
                  subtitle: 'Information about medicines',
                  color: Colors.blue,
                  onTap: () {
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: const SharedNavBar(currentIndex: 1),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.medicalGreen),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildServiceTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
} 