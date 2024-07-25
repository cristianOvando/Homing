import 'package:flutter/material.dart';
import 'package:homing/pages/account_page.dart';
import 'package:homing/pages/addhome_page.dart';
import 'package:homing/pages/home_page.dart';
import 'package:homing/pages/landing_page.dart';
import 'package:homing/pages/location_page.dart';
import 'package:homing/pages/login_page.dart' as login;
import 'package:homing/pages/nextaddhome_page.dart';
import 'package:homing/pages/register_page.dart';
import 'package:homing/pages/myhouse_page.dart';
import 'package:homing/pages/searchhome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homing',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 67, 93, 241)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
          '/': (context) => HomePage(),
          '/login': (context) => login.LoginPage(),
          '/register': (context) => RegisterPage(),
          '/landing': (context) => LandingPage(),
          '/searchpage': (context) => SearchPage(searchTerm: ''),
          '/info': (context) => const LocationPage(location: ''),
          '/account': (context) => const AccountPage(),
          '/myhouse': (context) => const MyHousePage(),
          '/addhome': (context) => const AddHomePage(),
          '/nextadd': (context) => const NextAddHomePage(),
        },
    );
  }
}
