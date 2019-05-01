class Coordinate {
  final int x, y;

  Coordinate(this.x, this.y);

  Coordinate.north() : this(0, -1);

  Coordinate.south() : this(0, 1);

  Coordinate.east() : this(1, 0);

  Coordinate.west() : this(-1, 0);

  @override
  bool operator ==(dynamic c) => x == c.x && y == c.y;

  Coordinate operator +(Coordinate c) {
    return new Coordinate(this.x + c.x, this.y + c.y);
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return 'Coordinate - x: $x y: $y';
  }
}
