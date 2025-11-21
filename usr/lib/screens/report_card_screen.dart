import 'package:flutter/material.dart';

class ReportCardScreen extends StatelessWidget {
  const ReportCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('کارنامه تحصیلی'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'کارنامه ماهانه'),
              Tab(text: 'کارنامه فصلی'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMonthlyReport(),
            _buildSeasonalReport(),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlyReport() {
    final List<Map<String, dynamic>> grades = [
      {'subject': 'ریاضی', 'score': 18.5, 'avg': 17.0},
      {'subject': 'علوم تجربی', 'score': 19.0, 'avg': 18.2},
      {'subject': 'ادبیات فارسی', 'score': 20.0, 'avg': 19.5},
      {'subject': 'زبان انگلیسی', 'score': 17.0, 'avg': 16.5},
      {'subject': 'عربی', 'score': 19.5, 'avg': 18.0},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            'گزارش عملکرد - مهر ماه ۱۴۰۲',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        ...grades.map((item) => _buildGradeRow(item)).toList(),
      ],
    );
  }

  Widget _buildSeasonalReport() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.bar_chart, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'کارنامه فصل پاییز هنوز صادر نشده است',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildGradeRow(Map<String, dynamic> item) {
    double score = item['score'];
    Color scoreColor = score >= 18
        ? Colors.green
        : (score >= 15 ? Colors.orange : Colors.red);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item['subject'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$score',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: scoreColor,
                      ),
                    ),
                    Text(
                      'میانگین کلاس: ${item['avg']}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
