import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class LocationState extends Equatable {
  final LatLng? userLocation;
  final String? userAddress;
  final bool loading;
  final String? error;
  final TextEditingController locationController;

  const LocationState({
    this.userLocation,
    this.userAddress,
    this.loading = false,
    this.error,
    required this.locationController,
  });

  LocationState copyWith({
    LatLng? userLocation,
    String? userAddress,
    bool? loading,
    String? error,
    TextEditingController? locationController,
  }) {
    return LocationState(
      userLocation: userLocation ?? this.userLocation,
      userAddress: userAddress ?? this.userAddress,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      locationController: locationController ?? this.locationController,
    );
  }

  @override
  List<Object?> get props =>
      [userLocation, userAddress, loading, error, locationController];
}
