import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/home_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/tuition_screen.dart';
import 'screens/report_card_screen.dart';
import 'screens/activities_screen.dart';

void main() {
  runApp(const SchoolApp());
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سیستم مدیریت مدرسه',
      debugShowCheckedModeBanner: false,
      // تنظیمات زبان فارسی و راست‌چین
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', 'IR'), // Farsi
      ],
      locale: const Locale('fa', 'IR'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F51B5)),
        useMaterial3: true,
        fontFamily: 'Roboto', // In a real app, use a Persian font like Vazir
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF3F51B5),
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/attendance': (context) => const AttendanceScreen(),
        '/tuition': (context) => const TuitionScreen(),
        '/report_card': (context) => const ReportCardScreen(),
        '/activities': (context) => const ActivitiesScreen(),
      },
    );
  }
}
