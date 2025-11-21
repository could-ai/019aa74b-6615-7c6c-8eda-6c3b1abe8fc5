import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for attendance
    final List<Map<String, dynamic>> attendanceHistory = [
      {'date': '۱۴۰۲/۰۸/۱۰', 'status': 'حاضر', 'color': Colors.green},
      {'date': '۱۴۰۲/۰۸/۰۹', 'status': 'حاضر', 'color': Colors.green},
      {'date': '۱۴۰۲/۰۸/۰۸', 'status': 'غایب', 'color': Colors.red},
      {'date': '۱۴۰۲/۰۸/۰۷', 'status': 'حاضر', 'color': Colors.green},
      {'date': '۱۴۰۲/۰۸/۰۶', 'status': 'تاخیر', 'color': Colors.orange},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('حضور و غیاب')),
      body: Column(
        children: [
          _buildSummaryCard(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: attendanceHistory.length,
              itemBuilder: (context, index) {
                final item = attendanceHistory[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: item['color'].withOpacity(0.1),
                      child: Icon(
                        item['status'] == 'حاضر'
                            ? Icons.check
                            : (item['status'] == 'غایب'
                                ? Icons.close
                                : Icons.access_time),
                        color: item['color'],
                      ),
                    ),
                    title: Text(item['date']),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: item['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item['status'],
                        style: TextStyle(
                          color: item['color'],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orangeAccent, Colors.deepOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('روزهای حاضر', '۲۵', Colors.white),
          _buildStatItem('غیبت‌ها', '۲', Colors.white),
          _buildStatItem('تاخیرها', '۱', Colors.white),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color.withOpacity(0.9),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
