import 'package:flutter/material.dart';
import 'package:flutter_application_12/helpers/location_helper.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewLocatonUrl;

  Future<void> _getUserCurrentLoction() async {
    final uLoc = await Location().getLocation();
    print(uLoc.latitude);
    print(uLoc.longitude);
    // final staticMapimageUrl = LocationHelper.generateloctionImagePriview(
    //     uLoc.latitude!, uLoc.longitude!);
    // setState(() {
    //   _previewLocatonUrl = staticMapimageUrl;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: _previewLocatonUrl == null
              ? const Text('No location ')
              : Image.network(_previewLocatonUrl!),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getUserCurrentLoction,
              icon: const Icon(
                Icons.location_on,
                size: 30,
              ),
              label: const Text(
                'Current location',
//                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.map,
                size: 30,
              ),
              label: const Text(
                'Select on Map',
                //              style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
