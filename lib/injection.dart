import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'Data/Google_api_service/apiservice.dart';
import 'Domain/Repository/places_repository.dart';
import 'Domain/Repository/places_repository_impl.dart';
import 'Domain/Usecase/get_places_use_case.dart';
import 'Presentation/Bloc/places_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory<http.Client>(() => http.Client());

  locator.registerLazySingleton<GooglePlacesApi>(
        () => GooglePlacesApi(
      httpClient: locator<http.Client>(),
    ),
  );

  locator.registerLazySingleton<PlacesRepository>(
        () => PlacesRepositoryImpl(locator<GooglePlacesApi>()),
  );

  locator.registerLazySingleton<GetPlaces>(
        () => GetPlaces(locator<PlacesRepository>()),
  );

  locator.registerFactory<PlacesBloc>(
        () => PlacesBloc(locator<GetPlaces>()),
  );
}


