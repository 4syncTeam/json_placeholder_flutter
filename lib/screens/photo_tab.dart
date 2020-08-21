import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsonplaceholder/bloc/photo_bloc.dart';
import 'package:jsonplaceholder/widgets/photo_card.dart';

class PhotoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.bloc<PhotoBloc>().add(GetPhotosEvent());
        },
        child: Icon(Icons.download_rounded),
      ),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotosLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PhotosArrived) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                return PhotoCard(state.photos[index]);
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
