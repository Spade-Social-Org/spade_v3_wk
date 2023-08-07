import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Data/Models/location.dart';
import '../../Domain/Usecase/get_location_details_usecase.dart';

abstract class LocationEvent {}

class GetLocationDetailsEvent extends LocationEvent {
  final LatLng location;

  GetLocationDetailsEvent(this.location);
}

abstract class LocationState {}

class LocationDetailsLoaded extends LocationState {
  final Locations location;

  LocationDetailsLoaded(this.location);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationDetailsUseCase getLocationDetailsUseCase;

  LocationBloc(this.getLocationDetailsUseCase) : super(LocationDetailsLoaded(Locations(name: "", address: "", urlImage: ''))); // Provide initial state

  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is GetLocationDetailsEvent) {
      try {
        final locationDetails = await getLocationDetailsUseCase.getLocationDetails(event.location);
        yield LocationDetailsLoaded(locationDetails);
      } catch (e) {
        yield LocationError("Failed to fetch location details.");
      }
    }
  }
}
