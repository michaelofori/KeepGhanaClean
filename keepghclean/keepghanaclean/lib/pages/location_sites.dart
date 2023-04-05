import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import '../model/location_service.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_webservice/geocoding.dart';

const kGoogleApiKey = 'AIzaSyCsDG0wJUNnciSuJpnVd95JcxxmtOtgBJA';

class RecycleSites extends StatefulWidget {
  const RecycleSites({Key? key}) : super(key: key);

  @override
  State<RecycleSites> createState() => MapSampleState();
}

class MapSampleState extends State<RecycleSites> {
  //Mode _mode = Mode.overlay;
 // Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;
  int _polylineIdCounter = 1;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5.603717, -0.186964),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();

    _setMarker(LatLng(5.603717, -0.186964));
  }

  void _setMarker(LatLng point) {
    setState(
      () {
        _markers.add(
          Marker(markerId: MarkerId('marker'), position: point),
        );
      },
    );
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(
      Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
    );
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: Colors.blue,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList(),
      ),
    );
  }

//new
String address = "null";
  String autocompletePlace = "null";
  
  Prediction? initialValue;

  
  final TextEditingController _controller = TextEditingController();
  //new

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Sites'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlacesAutocomplete(
            searchController: _controller,
            apiKey: "AIzaSyCsDG0wJUNnciSuJpnVd95JcxxmtOtgBJA",
            mounted: mounted,
            showBackButton: false,
            onGetDetailsByPlaceId: (PlacesDetailsResponse? result) {
              if (result != null) {
                setState(() {
                  autocompletePlace = result.result.formattedAddress ?? "";
                });
              }
            },
          ),
          OutlinedButton(
            child: Text('show dialog'.toUpperCase()),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Example'),
                    content: PlacesAutocomplete(
                      apiKey: "AIzaSyCsDG0wJUNnciSuJpnVd95JcxxmtOtgBJA",
                      searchHintText: "Search for a place",
                      mounted: mounted,
                      showBackButton: false,
                      initialValue: initialValue,
                      onSuggestionSelected: (value) {
                        setState(() {
                          autocompletePlace =
                              value.structuredFormatting?.mainText ?? "";
                          initialValue = value;
                        });
                      },
                      onGetDetailsByPlaceId: (value) {
                        setState(() {
                          address = value?.result.formattedAddress ?? "";
                        });
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Done'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Google Map Location Picker\nMade By Arvind 😃 with Flutter 🚀",
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Clipboard.setData(
              const ClipboardData(text: "https://www.mohesu.com"),
            ).then(
              (value) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Copied to Clipboard"),
                ),
              ),
            ),
            child: const Text("https://www.mohesu.com"),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              child: const Text('Pick location'),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MapLocationPicker(
                        apiKey: "AIzaSyCsDG0wJUNnciSuJpnVd95JcxxmtOtgBJA",
                        canPopOnNextButtonTaped: true,
                        currentLatLng: const LatLng(5.603717, -0.186964),
                        onNext: (GeocodingResult? result) {
                          if (result != null) {
                            setState(() {
                              address = result.formattedAddress ?? "";
                            });
                          }
                        },
                        onSuggestionSelected: (PlacesDetailsResponse? result) {
                          if (result != null) {
                            setState(() {
                              autocompletePlace =
                                  result.result.formattedAddress ?? "";
                            });
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          ListTile(
            title: Text("Geocoded Address: $address"),
          ),
          ListTile(
            title: Text("Autocomplete Address: $autocompletePlace"),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );

    

    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back, color: Colors.black),
    //       onPressed: () => Navigator.of(context).pop(),
    //     ),
    //     title: Text("Location Sites"),
    //     centerTitle: true,
    //   ),
    //   body: Column(
    //     children: [
    //       Row(
    //         children: <Widget>[
    //           _buildDropdownMenu(),
    //           const SizedBox(height: 12),
    //           ElevatedButton(
    //             onPressed: _handlePressButton,
    //             child: const Text('Search places'),
    //           ),
    //           const SizedBox(height: 12),
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.of(context).pushNamed('/search');
    //             },
    //             child: const Text('Custom'),
    //           ),
    //           //Expanded(
    //           // child: Column(
    //           //   children: [
    //           //     TextFormField(
    //           //       controller: _originController,
    //           //       decoration: InputDecoration(hintText: 'Origin'),
    //           //       onChanged: (value) {
    //           //         print(value);
    //           //       },
    //           //     ),
    //           //     TextFormField(
    //           //       controller: _destinationController,
    //           //       decoration: InputDecoration(hintText: 'destination'),
    //           //       onChanged: (value) {
    //           //         print(value);
    //           //       },
    //           //     ),
    //           //   ],
    //           // ),
    //           // ),
    //           // IconButton(
    //           //   onPressed: () async {
    //           //     var directions = await LocationService().getDirections(
    //           //         _originController.text, _destinationController.text);

    //           //     // _goToPlace(
    //           //     //   directions['start_location']['lat'],
    //           //     //   directions['start_location']['lng'],
    //           //     //   directions['bounds_ne'],
    //           //     //   directions['bounds_sw'],
    //           //     // );

    //           //     _setPolyline(directions['polyline_decoded']);
    //           //   },
    //           //   icon: const Icon(Icons.search),
    //           // ),
    //         ],
    //       ),

    //       // children: [
    //       //   Row(
    //       //     children: [
    //       //       Expanded(
    //       //         child: TextFormField(
    //       //           controller: _searchController,
    //       //           decoration: InputDecoration(hintText: 'Search by Sites'),
    //       //           onChanged: (value) {
    //       //             print(value);
    //       //           },
    //       //         ),
    //       //       ),

    //       //     ],
    //       //   ),
    //       Expanded(
    //         child: GoogleMap(
    //           mapType: MapType.normal,
    //           markers: _markers,
    //           polygons: _polygons,
    //           polylines: _polylines,
    //           initialCameraPosition: _kGooglePlex,
    //           onMapCreated: (GoogleMapController controller) {
    //             _controller.complete(controller);
    //           },
    //           onTap: (point) {
    //             setState(() {
    //               polygonLatLngs.add(point);
    //               _setPolygon();
    //             });
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  // Widget _buildDropdownMenu() {
  //   return DropdownButton<Mode>(
  //     value: _mode,
  //     items: const <DropdownMenuItem<Mode>>[
  //       DropdownMenuItem<Mode>(
  //         value: Mode.overlay,
  //         child: Text('Overlay'),
  //       ),
  //       DropdownMenuItem<Mode>(
  //         value: Mode.fullscreen,
  //         child: Text('Fullscreen'),
  //       ),
  //     ],
  //     onChanged: (m) {
  //       if (m != null) {
  //         setState(() => _mode = m);
  //       }
  //     },
  //   );
  // }

  // Future<void> _handlePressButton() async {
  //   void onError(PlacesAutocompleteResponse response) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(response.errorMessage ?? 'Unknown error'),
  //       ),
  //     );
  //   }

  //   // show input autocomplete with selected mode
  //   // then get the Prediction selected
  //   final p = await PlacesAutocomplete.show(
  //     context: context,
  //     apiKey: kGoogleApiKey,
  //     onError: onError,
  //     mode: _mode,
  //     language: 'fr',
  //     components: [Component(Component.country, 'fr')],
  //     // TODO: Since we supports Flutter >= 2.8.0
  //     // ignore: deprecated_member_use
  //     resultTextStyle: Theme.of(context).textTheme.subtitle1,
  //   );

  //   await displayPrediction(p, ScaffoldMessenger.of(context));
  // }

  // Future<void> displayPrediction(
  //     Prediction? p, ScaffoldMessengerState messengerState) async {
  //   if (p == null) {
  //     return;
  //   }

  //   // get detail (lat/lng)
  //   final _places = GoogleMapsPlaces(
  //     apiKey: kGoogleApiKey,
  //     apiHeaders: await const GoogleApiHeaders().getHeaders(),
  //   );

  //   final detail = await _places.getDetailsByPlaceId(p.placeId!);
  //   final geometry = detail.result.geometry!;
  //   final lat = geometry.location.lat;
  //   final lng = geometry.location.lng;

  //   messengerState.showSnackBar(
  //     SnackBar(
  //       content: Text('${p.description} - $lat/$lng'),
  //     ),
  //   );

  //   Future<void> _goToPlace(
  //     // (Map<String, dynamic> place)
  //     double lat,
  //     double lng,
  //     Map<String, dynamic> boundsNe,
  //     Map<String, dynamic> boundsSw,
  //   ) async {
  //     // final double lat = place['geometry']['location']['lat'];
  //     // final double lng = place['geometry']['location']['lng'];
  //     final GoogleMapController controller = await _controller.future;
  //     controller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(target: LatLng(lat, lng), zoom: 12),
  //       ),
  //     );

  //     controller.animateCamera(
  //       CameraUpdate.newLatLngBounds(
  //           LatLngBounds(
  //             southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
  //             northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
  //           ),
  //           25),
  //     );

  //     _setMarker(LatLng(lat, lng));
  //   }
 // }
}
