import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../screens/map_picker_screen.dart';

class AddAddressCard extends StatefulWidget {
  const AddAddressCard({super.key});

  @override
  State<AddAddressCard> createState() => _AddAddressCardState();
}

class _AddAddressCardState extends State<AddAddressCard> {
  String? selectedAddress;
  LatLng? selectedLatLng;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MapPickerScreen()),
        );

        if (result != null && result is Map<String, dynamic>) {
          setState(() {
            selectedAddress = result['address'];
            selectedLatLng = result['latlng'];
          });
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(61, 158, 158, 158),
              blurRadius: 5.6.r,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedLatLng != null)
              SizedBox(
                height: 150.h,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(4)),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: selectedLatLng!,
                      zoom: 14,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId("selected"),
                        position: selectedLatLng!,
                      ),
                    },
                    liteModeEnabled: true,
                    zoomControlsEnabled: false,
                    scrollGesturesEnabled: false,
                    rotateGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    onMapCreated: (controller) {},
                  ),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    selectedAddress ?? 'Add your Address',
                    style: AppTextStyles.fontHeaderText(),
                  ),
                ),
                const Icon(
                  Icons.location_on_sharp,
                  color: ColorsManager.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
