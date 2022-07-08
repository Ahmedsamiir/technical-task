import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technicaltask/presentation_layer/screens/home/cubit/cubit.dart';
import 'package:technicaltask/presentation_layer/screens/home/home_screen.dart';
import 'package:technicaltask/shared/network/remote.dart';
import 'package:technicaltask/shared/style/style.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technical Task',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: BlocProvider(
          create: (context) => ExhibitCubit(), child: HomeScreen()),
    );
  }
}
