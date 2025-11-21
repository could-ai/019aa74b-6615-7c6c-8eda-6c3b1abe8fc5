import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('گزارش فعالیت‌ها')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDateHeader('امروز - ۱۰ آبان'),
          _buildActivityItem(
            'تکلیف ریاضی',
            'حل تمرینات صفحه ۴۵ تا ۴۸ کتاب درسی',
            Icons.calculate,
            Colors.blue,
            false,
          ),
          _buildActivityItem(
            'آزمایشگاه علوم',
            'گزارش کار آزمایش فتوسنتز',
            Icons.science,
            Colors.green,
            true,
          ),
          const SizedBox(height: 20),
          _buildDateHeader('دیروز - ۹ آبان'),
          _buildActivityItem(
            'مطالعه اجتماعی',
            'روخوانی فصل سوم برای پرسش کلاسی',
            Icons.public,
            Colors.orange,
            true,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF3F51B5),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String description, IconData icon,
      Color color, bool isDone) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
            color: isDone ? Colors.grey : Colors.black,
          ),
        ),
        subtitle: Text(description),
        trailing: Checkbox(
          value: isDone,
          onChanged: (val) {},
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
