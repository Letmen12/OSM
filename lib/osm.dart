import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm/location/location_cubit.dart';
import 'package:osm/location/location_state.dart';
import 'package:osm/bottom/bottom_sheet.dart';
import 'package:osm/bottom/my_draggable_sheet.dart';
import 'package:osm/menubar/menu.dart';
import 'package:geolocator/geolocator.dart';
import 'package:osm/screen/late_page.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String add1 = "Реженси";
  String add2 = "резидэнс";
  String latilatitude = "Хаягийн ";
  String longlatitude = "байршил";
  final mapController = MapController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latilatitude = geoposition.latitude.toString();
      longlatitude = geoposition.longitude.toString();
    });

    final geoCode = GeoCode();
    final address = await geoCode.reverseGeocoding(
      latitude: geoposition.latitude,
      longitude: geoposition.longitude,
    );

    setState(() {
      add1 = address.streetAddress ?? 'Not found';
      add2 = '${address.city}, ${address.countryName}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: Scaffold(
        body: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, locationState) {
            if (locationState.userAddress != null) {
              _locationController.text = locationState.userAddress!;
            }
            return Stack(
              children: [
                _buildMap(locationState),
                _buildLocationButton(locationState),
                _buildMenuButton(context),
                _buildSearchField(),
                _buildLateLocation(),
              ],
            );
          },
        ),
        bottomSheet: MyDraggableSheet(
          child: Column(
            children: [
              BottomSheetDummyUI(
                add1: add1,
                add2: add2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMap(LocationState locationState) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: LatLng(47.919, 106.922),
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.map_tutorial',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            if (locationState.userLocation != null)
              _buildUserLocationMarker(locationState),
          ],
        ),
      ],
    );
  }

  Marker _buildUserLocationMarker(LocationState locationState) {
    return Marker(
      alignment: Alignment.topCenter,
      width: 80,
      height: 80,
      point: LatLng(
        locationState.userLocation!.latitude,
        locationState.userLocation!.longitude,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Text(
                  'Эндээ авах',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            width: 1.5,
            height: 15,
            color: Colors.black,
          ),
          SizedBox(height: 2),
          Container(
            width: 4,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 9, 115, 202),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationButton(LocationState locationState) {
    return Positioned(
      bottom: 440.0,
      right: 16.0,
      child: Column(
        children: [
          LocationButton(mapController: mapController),
          if (locationState.userAddress != null)
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Text(locationState.userAddress!),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return Positioned(
      top: 90.0,
      left: 15.0,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 222, 222, 222),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          },
          child: Icon(
            Icons.format_align_left_rounded,
            color: Color.fromARGB(255, 161, 158, 158),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Positioned(
      top: 60.0,
      left: 85.0,
      child: Container(
          padding: EdgeInsets.all(5),
          width: 290,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.gps_fixed,
                size: 13,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                width: 260,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: const Color.fromARGB(255, 239, 236, 236)),
                padding: EdgeInsets.only(
                  left: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      add1,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      add2,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Icon(
                      Icons.star_outline,
                      size: 13,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _buildLateLocation() {
    return Positioned(
      top: 130.0,
      left: 85.0,
      child: Container(
          padding: EdgeInsets.all(5),
          width: 290,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.gps_fixed,
                size: 13,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: const Color.fromARGB(255, 239, 236, 236)),
                padding: EdgeInsets.only(
                  left: 7,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LatePage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Очих хаяг",
                          style: TextStyle(fontSize: 12, color: Colors.grey))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class LocationButton extends StatelessWidget {
  final MapController mapController;

  LocationButton({Key? key, required this.mapController}) : super(key: key);
  Future<void> checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        print('Location permission denied');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return Color.fromARGB(255, 249, 248, 248);
          },
        ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (Set<MaterialState> states) {
            return const Size(20, 70);
          },
        ),
      ),
      onPressed: () async {
        final locationCubit = context.read<LocationCubit>();

        await checkAndRequestPermission();

        LocationPermission permission = await Geolocator.checkPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          debugPrint('Location permission not granted');
          return;
        }

        await locationCubit.getUserLocation();

        if (locationCubit.state.userLocation != null) {
          debugPrint("User location available");
          final userLocation = locationCubit.state.userLocation!;
          await locationCubit.getAddressFromLatLng(
              userLocation.latitude, userLocation.longitude);

          mapController.move(
            LatLng(userLocation.latitude, userLocation.longitude),
            mapController.zoom,
          );
        } else {
          debugPrint("User location not available");
        }
      },
      child: const Icon(
        Icons.gps_fixed_outlined,
        color: Color.fromARGB(255, 87, 86, 87),
        size: 24.0,
      ),
    );
  }
}
