class Coordinate {
  final int x, y;

  Coordinate(this.x, this.y);

  @override
  bool operator ==(dynamic c) => x == c.x && y == c.y;

  // implement + and - operator as well.

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() {
    return 'Coordinate - x: $x y: $y';
  }
}
