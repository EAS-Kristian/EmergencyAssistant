import 'package:flutter/material.dart';
import '../models/assessment_record.dart';
import 'package:intl/intl.dart';

class AssessmentSummaryCard extends StatelessWidget {
  final AssessmentRecord assessment;

  const AssessmentSummaryCard({
    super.key,
    required this.assessment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        childrenPadding: const EdgeInsets.all(16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.event_note, size: 20, color: Colors.grey[700]),
                const SizedBox(width: 8),
                Text(
                  DateFormat('dd/MM/yyyy').format(assessment.timestamp),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  DateFormat('HH:mm').format(assessment.timestamp),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  title: 'Danger Assessment',
                  icon: Icons.warning_amber_rounded,
                  color: Colors.orange,
                  checks: assessment.dangerChecks,
                ),
                _buildSection(
                  title: 'Response',
                  icon: Icons.person_outline,
                  color: Colors.blue,
                  checks: assessment.responseChecks,
                ),
                if (assessment.catastrophicBleedChecks.values.any((value) => value))
                  _buildSection(
                    title: 'Catastrophic Bleeding',
                    icon: Icons.local_hospital,
                    color: Colors.red,
                    checks: assessment.catastrophicBleedChecks,
                  ),
                if (assessment.tourniquetTime != null)
                  _buildTimeInfo(
                    title: 'Tourniquet Applied',
                    time: assessment.tourniquetTime!,
                    icon: Icons.timer,
                    color: Colors.red,
                  ),
                if (assessment.breathingRate != null)
                  _buildInfo(
                    title: 'Breathing Rate',
                    value: assessment.breathingRate!,
                    icon: Icons.air,
                    color: Colors.green,
                  ),
                _buildSection(
                  title: 'Circulation',
                  icon: Icons.favorite_border,
                  color: Colors.red,
                  checks: assessment.circulationChecks,
                ),
                _buildDamageSection(
                  title: 'Damage Assessment',
                  icon: Icons.medical_services_outlined,
                  color: Colors.purple,
                  checks: assessment.damageChecks,
                ),
                _buildEnvironmentSection(
                  title: 'Environment',
                  icon: Icons.thermostat_outlined,
                  color: Colors.teal,
                  checks: assessment.environmentChecks,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color color,
    required Map<String, bool> checks,
  }) {
    final activeChecks = checks.entries.where((e) => e.value).map((e) => e.key).toList();
    if (activeChecks.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...activeChecks.map((check) => Padding(
            padding: const EdgeInsets.only(left: 28, bottom: 4),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 16,
                  color: color.withOpacity(0.8),
                ),
                const SizedBox(width: 8),
                Text(
                  check,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          )),
          const Divider(height: 24),
        ],
      ),
    );
  }

  Widget _buildTimeInfo({
    required String title,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 8),
            child: Text(
              DateFormat('HH:mm').format(DateTime.parse(time)),
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
            ),
          ),
          const Divider(height: 24),
        ],
      ),
    );
  }

  Widget _buildInfo({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 8),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
            ),
          ),
          const Divider(height: 24),
        ],
      ),
    );
  }

  Widget _buildDamageSection({
    required String title,
    required IconData icon,
    required Color color,
    required Map<String, Map<String, bool>> checks,
  }) {
    bool hasAnyDamage = checks.values.any((region) => region.values.any((value) => value));
    if (!hasAnyDamage) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...checks.entries.map((region) {
            final activeInjuries = region.value.entries
                .where((injury) => injury.value)
                .map((injury) => injury.key)
                .toList();
                
            if (activeInjuries.isEmpty) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.only(left: 28, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    region.key,  
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: color.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...activeInjuries.map((injury) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: color.withOpacity(0.6),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          injury,  
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            );
          }).where((widget) => widget != const SizedBox.shrink()),
          const Divider(height: 24),
        ],
      ),
    );
  }

  Widget _buildEnvironmentSection({
    required String title,
    required IconData icon,
    required Color color,
    required Map<String, Map<String, dynamic>> checks,
  }) {
    bool hasAnyEnvironmentChecks = checks.values.any((item) => item['used'] == true);
    if (!hasAnyEnvironmentChecks) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...checks.entries
              .where((entry) => entry.value['used'] == true)
              .map((entry) {
            return Padding(
              padding: const EdgeInsets.only(left: 28, bottom: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: color.withOpacity(0.8),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    entry.key,
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  if (entry.key == 'Heat Packs' && entry.value['count'] > 0)
                    Text(
                      ' (${entry.value['count']} used)',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            );
          }),
          const Divider(height: 24),
        ],
      ),
    );
  }
} 