import 'package:flutter/material.dart';
import 'package:user_profile/screens/main_dashboard.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(
            231, 255, 255, 255)),
        useMaterial3: true,
      ),
      home:  const MainDashBoard(),
    );
  }
}



