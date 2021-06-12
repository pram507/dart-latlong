import 'dart:math';
import 'package:latlong/latlong.dart';

void main() {
  var distance = Distance();

  // km = 423
  final km = distance.as(LengthUnit.Kilometer, LatLng(52.518611, 13.408056), LatLng(51.519475, 7.46694444));

  // meter = 422591.551
  final meter = distance(LatLng(52.518611, 13.408056), LatLng(51.519475, 7.46694444));

  print('km: $km, meter: $meter');

  distance = const Distance();
  final num distanceInMeter = (equatorRadius * pi / 4).round();

  final p1 = LatLng(0.0, 0.0);
  final p2 = distance.offset(p1, distanceInMeter, 180);

  // LatLng(latitude:-45.219848, longitude:0.0)
  print(p2.round());

  // 45° 13' 11.45" S, 0° 0' 0.00" O
  print(p2.toSexagesimal());
}
