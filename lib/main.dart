import 'package:flutter/material.dart';
import 'package:flutter_assessment2_anwar_tabbaa/API/dio_client.dart';
import 'package:flutter_assessment2_anwar_tabbaa/screens/home_page.dart';
import 'package:flutter_assessment2_anwar_tabbaa/screens/tab_bar_screen.dart';
// import 'package:rest_api/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => DioClient())],
      child: TabBarScreen()
    );
  }
}
