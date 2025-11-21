import 'package:flutter/material.dart';

class TuitionScreen extends StatelessWidget {
  const TuitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('امور مالی و شهریه')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            const Text(
              'تاریخچه پرداخت‌ها',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildTransactionItem(
                'قسط اول شهریه', '۱۴۰۲/۰۷/۰۱', '۵,۰۰۰,۰۰۰ تومان', true),
            _buildTransactionItem(
                'هزینه سرویس مهر', '۱۴۰۲/۰۷/۰۵', '۱,۰۰۰,۰۰۰ تومان', true),
            _buildTransactionItem(
                'قسط دوم شهریه', '۱۴۰۲/۰۸/۰۱', '۵,۰۰۰,۰۰۰ تومان', false),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Mock payment action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('درگاه پرداخت باز می‌شود...')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'پرداخت آنلاین',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: const [
          Text(
            'مبلغ قابل پرداخت',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            '۵,۰۰۰,۰۰۰ تومان',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Divider(color: Colors.white24),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('کل شهریه سالانه', style: TextStyle(color: Colors.white70)),
              Text('۲۰,۰۰۰,۰۰۰ تومان', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
      String title, String date, String amount, bool isPaid) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isPaid ? Colors.green[100] : Colors.red[100],
          child: Icon(
            isPaid ? Icons.check : Icons.priority_high,
            color: isPaid ? Colors.green : Colors.red,
          ),
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              isPaid ? 'پرداخت شده' : 'پرداخت نشده',
              style: TextStyle(
                fontSize: 12,
                color: isPaid ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
