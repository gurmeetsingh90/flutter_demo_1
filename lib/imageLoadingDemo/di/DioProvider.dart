

import 'package:bloc_demo/imageLoadingDemo/ImageBloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup(){
  // register Dio as Singlton
  getIt.registerSingleton<Dio>(Dio());

// register your ImageBloc if needed
  getIt.registerFactory(() => ImageBloc(getIt<Dio>()));
}