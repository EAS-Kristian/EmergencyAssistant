import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/shared_nav_bar.dart';
import '../constants/colors.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Resources',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Medical Information',
              icon: Icons.medical_information,
              children: [
                _buildResourceTile(
                  icon: Icons.health_and_safety,
                  title: 'NHS Health A-Z',
                  subtitle: 'Comprehensive health information',
                  color: Colors.blue,
                  onTap: () {
                  },
                ),
                _buildResourceTile(
                  icon: Icons.medication,
                  title: 'Medicine Guide',
                  subtitle: 'Information about medications',
                  color: Colors.blue,
                  onTap: () {
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _buildSection(
              title: 'Emergency Training',
              icon: Icons.school,
              children: [
                _buildResourceTile(
                  icon: Icons.favorite,
                  title: 'CPR Training',
                  subtitle: 'Learn life-saving CPR techniques',
                  color: Colors.red,
                  onTap: () {
                  },
                ),
                _buildResourceTile(
                  icon: Icons.medical_services,
                  title: 'First Aid Courses',
                  subtitle: 'Find local first aid training',
                  color: Colors.red,
                  onTap: () {
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _buildSection(
              title: 'Local Services',
              icon: Icons.location_on,
              children: [
                _buildResourceTile(
                  icon: Icons.local_hospital,
                  title: 'Find Hospitals',
                  subtitle: 'Locate nearest hospitals',
                  color: AppColors.medicalGreen,
                  onTap: () {
                  },
                ),
                _buildResourceTile(
                  icon: Icons.local_pharmacy,
                  title: 'Pharmacy Finder',
                  subtitle: '24-hour and local pharmacies',
                  color: AppColors.medicalGreen,
                  onTap: () {
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _buildSection(
              title: 'Additional Resources',
              icon: Icons.more_horiz,
              children: [
                _buildResourceTile(
                  icon: Icons.phone,
                  title: 'Helplines',
                  subtitle: 'Mental health and support services',
                  color: Colors.purple,
                  onTap: () {
                  },
                ),
                _buildResourceTile(
                  icon: Icons.language,
                  title: 'Online Support',
                  subtitle: 'Web resources and communities',
                  color: Colors.purple,
                  onTap: () {
                  },
                ),
              ],
            ),
            
            const SizedBox(height: 80), 
          ],
        ),
      ),
      bottomNavigationBar: const SharedNavBar(currentIndex: 2),
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

  Widget _buildResourceTile({
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