import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:flutter/services.dart';

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
          // OutlinedButton(
          //   child: Text('show dialog'.toUpperCase()),
          //   onPressed: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) {
          //         return AlertDialog(
          //           title: const Text('Example'),
          //           content: PlacesAutocomplete(
          //             apiKey: "AIzaSyCsDG0wJUNnciSuJpnVd95JcxxmtOtgBJA",
          //             searchHintText: "Search for drop point",
          //             mounted: mounted,
          //             showBackButton: false,
          //             initialValue: initialValue,
          //             onSuggestionSelected: (value) {
          //               setState(() {
          //                 autocompletePlace =
          //                     value.structuredFormatting?.mainText ?? "";
          //                 initialValue = value;
          //               });
          //             },
          //             onGetDetailsByPlaceId: (value) {
          //               setState(() {
          //                 address = value?.result.formattedAddress ?? "";
          //               });
          //             },
          //           ),
          //           actions: <Widget>[
          //             TextButton(
          //               child: const Text('Done'),
          //               onPressed: () => Navigator.of(context).pop(),
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   },
          // ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            // child: Text(
            //   "Monitor from our web apge",
            //   textAlign: TextAlign.center,
            //   textScaleFactor: 1.2,
            //   style: TextStyle(
            //     color: Colors.grey,
            //   ),
            // ),
          ),
          TextButton(
            onPressed: () => Clipboard.setData(
              const ClipboardData(text: "https://www.keepghanaclean.com"),
            ).then(
              (value) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Copied to Clipboard"),
                ),
              ),
            ),
            child: const Text("https://www.keepghanaclean.com"),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              child: const Text('View Recycle Sites '),
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
            title: Text("Location Site Address: $address"),
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
  }
}
