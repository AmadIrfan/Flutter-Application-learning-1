import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  String? _priviewLocationUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: _priviewLocationUrl == null
              ? const Text('no Location Selected')
              : Image.network(_priviewLocationUrl!),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () {
                _getCurrentLocation();
              },
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select On Map'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _getCurrentLocation() async {
    final loct = await Location().getLocation();
    print(loct.longitude);
    print(loct.latitude);
  }
}
