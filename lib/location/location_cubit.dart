import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'location_state.dart';
import 'package:flutter/material.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit()
      : super(LocationState(locationController: TextEditingController()));

  @override
  Future<void> close() {
    state.locationController.dispose();
    return super.close();
  }

  Future<void> getUserLocation() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      LatLng userLocation = LatLng(position.latitude, position.longitude);
      emit(state.copyWith(userLocation: userLocation, loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false, error: 'Failed to get location: $e'));
    }
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        String address =
            '${placemark.name}, ${placemark.locality}, ${placemark.country}';
        emit(state.copyWith(userAddress: address, loading: false));
        state.locationController.text = address; // Update the text field
        return address;
      } else {
        emit(state.copyWith(loading: false, error: 'No address found'));
        return 'No address found';
      }
    } catch (e) {
      emit(state.copyWith(loading: false, error: 'Failed to get address: $e'));
      return 'Failed to get address: $e';
    }
  }
}
