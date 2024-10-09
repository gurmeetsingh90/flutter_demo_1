import 'package:bloc_demo/CounterPage.dart';
import 'package:bloc_demo/imageLoadingDemo/ImageBloc.dart';
import 'package:bloc_demo/imageLoadingDemo/ImageEvent.dart';
import 'package:bloc_demo/imageLoadingDemo/ImageListScreen.dart';
import 'package:bloc_demo/imageLoadingDemo/di/DioProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Call setup to register dependencies
  setup();  // Ensure setup is called here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home:  CounterPage(),
      home: BlocProvider(
        create: (_)=> getIt<ImageBloc>()..add(FetchImages()),
        child: ImageListScreen(),
      ),
    );
  }
}

