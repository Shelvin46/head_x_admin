import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:head_x_admin/presentation/auth/admin_login.dart';

late MediaQueryData myMediaQueryData;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  myMediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MainLoginPage(),
    );
  }
}
