import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder/data_provider/provider.dart';
import 'package:jsonplaceholder/model/photo_model.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  Provider provider;
  PhotoBloc() : super(PhotoInitial()) {
    provider = Provider();
  }

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    if (event is GetPhotosEvent) {
      yield PhotosLoading();

      List<PhotoModel> photos = await provider.getPhotos();
      yield PhotosArrived(photos);
    }
  }
}

// States
class PhotoState extends Equatable {
  @override
  List<Object> get props => [];
}

class PhotosLoading extends PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotosArrived extends PhotoState {
  List<PhotoModel> photos;
  PhotosArrived(this.photos);
}

// Events
class PhotoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPhotosEvent extends PhotoEvent {}
