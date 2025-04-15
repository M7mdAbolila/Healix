import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:healix/core/widgets/custom_button.dart';

import '../../../../core/theming/colors.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  LatLng? selectedLocation;
  GoogleMapController? mapController;
  String? address;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _setCurrentLocation();
  }

  Future<void> _setCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      final settings = const LocationSettings(
        accuracy: LocationAccuracy.high,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: settings,
      );

      setState(() {
        selectedLocation = LatLng(position.latitude, position.longitude);
        isLoading = false;
      });

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          address = "${place.street}, ${place.locality}, ${place.country}";
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onMapTap(LatLng position) async {
    setState(() => selectedLocation = position);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks.first;
    setState(() {
      address = "${place.street}, ${place.locality}, ${place.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choosing Location"),
        backgroundColor: ColorsManager.primaryColor,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
              ),
            )
          : selectedLocation == null
              ? const Center(child: Text("Unable to get location."))
              : Column(
                  children: [
                    Expanded(
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: selectedLocation!,
                          zoom: 14,
                        ),
                        onMapCreated: (controller) =>
                            mapController = controller,
                        onTap: _onMapTap,
                        markers: {
                          Marker(
                            markerId: const MarkerId('selected-location'),
                            position: selectedLocation!,
                          )
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        spacing: 16.h,
                        children: [
                          if (address != null)
                            Text(
                              address!,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.fontHeaderText(
                                color: ColorsManager.primaryColor,
                              ),
                            ),
                          CustomButton(
                            title: 'Save',
                            onTap: () {
                              Navigator.pop(
                                context,
                                {
                                  "address": address ?? "Selected location",
                                  "latlng": selectedLocation,
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
