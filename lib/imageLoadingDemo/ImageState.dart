import 'ImageModel.dart';

abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {

  final List<ImageModel> images;

  ImageLoaded(this.images);
}

class ImageError extends ImageState{
  final String message;

  ImageError(this.message);
}