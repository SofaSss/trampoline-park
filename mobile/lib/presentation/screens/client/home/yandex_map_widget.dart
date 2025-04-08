part of 'client_home_part.dart';

class YandexMapWidget extends StatefulWidget {
  const YandexMapWidget({super.key});

  @override
  State<YandexMapWidget> createState() => _YandexMapWidgetState();
}

class _YandexMapWidgetState extends State<YandexMapWidget> {
  mapkit.YandexMapController? _mapController;

  final mapkit.Point _point = const mapkit.Point(
    latitude: 47.256913,
    longitude: 39.712713,
  );

  final List<mapkit.MapObject> _mapObjects = [];

  @override
  void initState() {
    super.initState();

    _mapObjects.add(
      mapkit.PlacemarkMapObject(
        mapId: const mapkit.MapObjectId('ic_pin'),
        point: _point,
        icon: mapkit.PlacemarkIcon.single(
          mapkit.PlacemarkIconStyle(
            image: mapkit.BitmapDescriptor.fromAssetImage(
              'assets/logo/ic_pin.png',
            ),
            scale: 1,
          ),
        ),
        onTap: (object, point) {
          ScaffoldMessenger.of(context).showSnackBar(
            baseSnackBar(
              context: context,
              message: context.localization.address,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightGray),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: mapkit.YandexMap(
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          tiltGesturesEnabled: true,
          zoomGesturesEnabled: true,
          onMapCreated: (controller) {
            _mapController = controller;
            _mapController!.moveCamera(
              mapkit.CameraUpdate.newCameraPosition(
                mapkit.CameraPosition(target: _point, zoom: 12),
              ),
            );
          },
          mapObjects: _mapObjects,
        ),
      ),
    );
  }
}
