import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spade_v4/Data/repository/camera_repository.dart';
import 'package:spade_v4/Presentation/Screens/Home/home_screen_ui.dart';
import 'package:spade_v4/Presentation/logic_holder/bloc/camera_bloc/camera_bloc.dart';
import 'Common/size_config/size_config.dart';
import 'Presentation/logic_holder/bloc/heart_bloc/heart_bloc.dart';

//import 'package:spade/onbording.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HeartIconBloc>(create: (_) => HeartIconBloc()),
        BlocProvider<CameraBloc>(create: (_) => CameraBloc(CameraRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spade',
        theme: ThemeData(),
        // home: Onbording()
        //initialRoute: Routes.getStarted,

        navigatorKey: kNavigatorKey,
        // onGenerateRoute: RouteGenerator.onGenerateRoute,
        //onUnknownRoute: RouteGenerator.unKnownRoute,
       
          home: const HomeScreenUi(),
        
        ) 
      );
    
 
  }
}
