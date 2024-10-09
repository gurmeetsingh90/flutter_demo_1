import 'package:bloc_demo/imageLoadingDemo/ImageEvent.dart';
import 'package:bloc_demo/imageLoadingDemo/ImageModel.dart';
import 'package:bloc_demo/imageLoadingDemo/ImageState.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final Dio _dio;

  ImageBloc(this._dio) : super(ImageInitial()) {
    // Handle FetchImages event
    on<FetchImages>((event, emit) async {
      emit(ImageLoading()); // Emit loading state

      try {
        final response = await _dio.get('https://picsum.photos/v2/list');
        if (response.statusCode == 200) {
          List<dynamic> jsonResponse = response.data;
          List<ImageModel> images = jsonResponse
              .map<ImageModel>((data) => ImageModel.fromJson(data))
              .toList();
          emit(ImageLoaded(images)); // Emit loaded state with images
        } else {
          emit(ImageError("Failed to load images"));
        }
      } on DioError catch (dioError) {
        emit(ImageError(
            "DioError: ${dioError.message}")); // Emit error state for Dio errors
      } catch (e) {
        emit(ImageError("Error: $e"));
      }
    });
  }

/* @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is FetchImages) {
      yield ImageLoading();
    }
    try {
      final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));
      print("statusCode  \n ${response.statusCode}");
      if (response.statusCode == 200) {
        print("Response code \n ${response.body}");
        List jsonResponse = json.decode(response.body);
        List<ImageModel> images =
            jsonResponse.map((data) => ImageModel.fromJson(data)).toList();
        yield ImageLoaded(images);
      } else {
        yield ImageError("Failed to load images");
      }
    } catch (e) {
      yield ImageError("Error : $e");
    }
  }*/
}
