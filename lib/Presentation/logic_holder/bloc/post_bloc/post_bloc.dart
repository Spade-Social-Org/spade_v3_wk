// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../Data/data_source/remote_data_sorce/post_services/post_services.dart';


// part 'post_event.dart';
// part 'post_state.dart';

// class PostBloc extends Bloc<PostEvent, PostState> {

//   List<File> listImages = [];

//   PostBloc() : super(const PostState()) {

//     on<OnAddNewPostEvent>(_addNewPost);
//   }


//   Future<void> _addNewPost( OnAddNewPostEvent event, Emitter<PostState> emit ) async {

//     try {

//       emit( LoadingPost() );

//       final data = await postService.addNewPost(listImages);

//       await Future.delayed(const Duration(milliseconds: 350));

//       if( data.resp ){

//         emit( SuccessPost() );

//         listImages.clear();
//         emit(state.copyWith( imageFileSelected: listImages ));
        
//       }else{
//         emit( FailurePost(data.message) );
//       }
      
//     } catch (e) {
//       emit(FailurePost(e.toString()));
//     }

//   }
// }
