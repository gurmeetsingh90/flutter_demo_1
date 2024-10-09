import 'package:bloc_demo/imageLoadingDemo/ImageBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ImageState.dart';

class ImageListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is ImageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ImageLoaded) {
            return ListView.builder(
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  elevation: 5, // Add some elevation to give depth
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        state.images[index].downloadUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover, // Ensure image covers the box
                      ),
                    ),
                    title: Text(
                      state.images[index].author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      "Photo by ${state.images[index].author}",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is ImageError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state is ImageLoaded && state.images.isEmpty) {
            return Center(
              child: Text('No images found.'),
            );
          } else {
            return Center(
              child: Text('Press the button to load images'),
            );
          }
        },
      ),
    );
  }
}

/// for Simple View
/// /*
// class ImageListScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Photo Sample'),),
//       body: BlocBuilder<ImageBloc, ImageState>(
//         builder: ( context,  state) {
//           if(state is ImageLoading){
//             return Center(child: CircularProgressIndicator());
//           }else if(state is ImageLoaded){
//             return ListView.builder(
//               itemCount: state.images.length,
//               itemBuilder: (context, index){
//                 return ListTile(
//                   leading: Image.network(state.images[index].downloadUrl),
//                   title: Text(state.images[index].author),
//                 );
//               },
//             );
//           }else if (state is ImageLoaded && state.images.isEmpty) {
//             return Center(child: Text('No images found.'));
//           }else if(state is ImageError){
//             return Center(child: Text(state.message));
//           }else{
//             return Center(child: Text('press the button to load image '),);
//           }
//         },
//       )
//     );
//   }
//
// }*/
