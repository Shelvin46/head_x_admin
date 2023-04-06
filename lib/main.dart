import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/application/image_picker/image_picker_bloc.dart';
import 'package:head_x_admin/application/product_displaying/product_displaying_bloc.dart';
// import 'package:head_x_admin/application/product_images/product_images_bloc.dart';
import 'package:head_x_admin/presentation/auth/admin_login.dart';

late MediaQueryData myMediaQueryData;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

  myMediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return ProductDisplayingBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return ImagePickerBloc();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const MainLoginPage(),
      ),
    );
  }
}
