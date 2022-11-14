class ResultEntity {
  double areaFloor;
  int piecesByWidth;
  int piecesByLength;

  ResultEntity({required this.areaFloor, required this.piecesByLength, required this.piecesByWidth});

  int get amountPieces => piecesByWidth * piecesByLength;
  int get amountFloor => piecesByLength + piecesByLength;
  int get amountPiecesAndFooter => amountPieces + amountFloor;
  double get areaWithouFooter => amountPieces * areaFloor;
  double get areaWithFooter => amountPiecesAndFooter * areaFloor;
}
