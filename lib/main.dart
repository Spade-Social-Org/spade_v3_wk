import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spade_v4/Common/navigator.dart';
import 'package:spade_v4/Data/Service/geo_locator.dart';
import 'Common/routes/route_generator.dart';
import 'Presentation/Bloc/places_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'Presentation/Screens/Camera/camera_screen.dart';
import 'package:spade_v4/injection.dart' as di;
import 'prefs/pref_provider.dart';
import 'Presentation/Screens/onboarding/landing_screen.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  GeoLocatorService.getInitialLocation();
  cameras = await availableCameras();
  di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PlacesBloc>(
          create: (context) => locator<PlacesBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spade',
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
              ),
              useMaterial3: true),
          navigatorKey: kNavigatorKey,
          onGenerateRoute: RouteGenerator.onGenerateRoute,
          onUnknownRoute: RouteGenerator.unKnownRoute,
          home: const AuthStateChangeNotifier()),
    );
  }
}

final userAuthFutureProvider =
    FutureProvider((ref) => ref.watch(userAuthChange));

class AuthStateChangeNotifier extends ConsumerWidget {
  const AuthStateChangeNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(userAuthFutureProvider).when(
          data: (data) => data == null
              ? const LandingScreen()
              : const NavigationContainer(),
          error: (e, t) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink()),
    );
  }
}
