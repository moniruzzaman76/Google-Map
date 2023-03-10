import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyMapApp());
}

class MyMapApp extends StatelessWidget {
  const MyMapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController googleMapController;

  Set<Marker> markers = <Marker>{};

  @override
  void initState() {
    super.initState();
    markers = {
      Marker(
        onTap: () {
          print('Marker tapped');
        },
        flat: false,
        draggable: true,
        onDrag: (location) {
          print(location);
        },
        onDragStart: (location) {
          print(location);
        },
        onDragEnd: (location) {
          print(location);
        },
        rotation: 50,
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(
            title: 'BRTA',
            onTap: () {
              print('Info window tapped');
            }
        ),
        markerId: const MarkerId('abc'),
        position: const LatLng(23.80560326575505, 90.3745761108481),
      ),
      Marker(
        onTap: () {
          print('Marker tapped');
        },
        flat: false,
        draggable: true,
        onDrag: (location) {
          print(location);
        },
        onDragStart: (location) {
          print(location);
        },
        onDragEnd: (location) {
          print(location);
        },
        rotation: 50,
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueMagenta),
        infoWindow: InfoWindow(
            title: 'Scholastic',
            onTap: () {
              print('Info window tapped');
            }
        ),
        markerId: const MarkerId('lksfk'),
        position: const LatLng(23.80472443775955, 90.3774966942303),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapview'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                zoom: 17,
                target: LatLng(23.809296231228714, 90.41996958386494),
              ),
            ),
          );
        },
        child: const Icon(Icons.location_on_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

      body: GoogleMap(
        mapType: MapType.normal,
        liteModeEnabled: true,
        myLocationEnabled: true,
        trafficEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        markers: markers,
        polylines: <Polyline> {
          const Polyline(
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
            visible: true,
            color: Colors.blueAccent,
            width: 6,
            polylineId: PolylineId('sfd'),
            points: [
              LatLng(23.80560326575505, 90.3745761108481),
              LatLng(23.80472443775955, 90.3774966942303),
              LatLng(23.802806379193132, 90.37997359405793),
            ],
          ),
          Polyline(
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
            visible: true,
            color: Colors.red,
            width: 6,
            polylineId: const PolylineId('sdsad'),
            onTap: () {
              print('Tapped polyline');
            },
            points: const [
              LatLng(23.802806379193132, 90.37997359405793),
              LatLng(23.80273514001151, 90.37519285964767),
            ],
          ),
        },
        // polygons: <Polygon> {
        //   Polygon(
        //     polygonId: PolygonId('sfdsdf'),
        //     points: [
        //       LatLng(23.80560326575505, 90.3745761108481),
        //       LatLng(23.80472443775955, 90.3774966942303),
        //       LatLng(23.802806379193132, 90.37997359405793),
        //       LatLng(23.80273514001151, 90.37519285964767),
        //     ]
        //   )
        // },
        circles: <Circle> {
          const Circle(
              circleId: CircleId('sfdf'),
              center: LatLng(23.80273514001151, 90.37519285964767),
              radius: 200,
              strokeColor: Colors.blue,
              strokeWidth: 2,
              fillColor: Colors.transparent
          )
        },

        onMapCreated: (GoogleMapController? controller) {
          googleMapController = controller!;
        },
        initialCameraPosition: const CameraPosition(
          zoom: 16,
          target: LatLng(23.80560326575505, 90.3745761108481),
        ),
      ),
    );
  }
}