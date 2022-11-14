import 'package:m2calc/core/helpers/parse_point_for_comma.dart';
import 'package:m2calc/domain/entites/floor_entity.dart';
import 'package:m2calc/domain/entites/result_entity.dart';
import 'package:m2calc/domain/entites/room_entity.dart';

class CalculatorController {
  late RoomEntity roomEntity;
  late FloorEntity floorEntity;

  CalculatorController() {
    roomEntity = RoomEntity(length: 0.0, width: 0.0);
    floorEntity = FloorEntity(length: 0.0, width: 0.0);
  }

  setRoomWidgth(String? value) {
    roomEntity.width = ParsePointForComma.toDouble(value);
  }

  setRoomLegth(String? value) {
    roomEntity.length = ParsePointForComma.toDouble(value);
  }

  setFloorWidth(String? value) {
    floorEntity.width = ParsePointForComma.toDouble(value);
  }

  setFloorLength(String? value) {
    floorEntity.length = ParsePointForComma.toDouble(value);
  }

  ResultEntity calculate() {
    double areaFloor = floorEntity.length * floorEntity.width;
    int piecesByLength = (roomEntity.length / floorEntity.length).ceil();
    int piecesByWidth = (roomEntity.width / floorEntity.width).ceil();
    final ResultEntity result = ResultEntity(areaFloor: areaFloor, piecesByLength: piecesByLength, piecesByWidth: piecesByWidth);
    return result;
  }
}
