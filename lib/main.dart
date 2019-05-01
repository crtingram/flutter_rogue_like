import 'package:flutter/material.dart';
import 'package:flutter_rogue_like/models/map.dart';
import 'package:flutter_rogue_like/models/map-tile.dart';
import 'package:flutter_rogue_like/models/entities/entity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Map map = new Map();

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          _buildHpBar(),
          _buildGridView(screenWidth),
          _buildButtonRow(),
          _buildListView()
        ],
      ),
    ));
  }

  Widget _buildHpBar() {
    return Row(
      children: <Widget>[
        Container(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Text(
            ' HP ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Colors.red, Colors.red],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
        ),
      ],
    );
  }

  Widget _buildGridView(double screenWidth) {
    return Flexible(
      flex: 2,
      child: GridView.extent(
          maxCrossAxisExtent: screenWidth / 9,
          children: map.mapTiles.map<Widget>((MapTile tile) {
            return _buildGridTile(tile);
          }).toList()),
    );
  }

  Widget _buildGridTile(MapTile mapTile) {
    List<Widget> icons = new List<Widget>();

    double defaultIconSize = 40.0;
    num contentsLength = mapTile.contents.length;

    num tileIcon = mapTile.iconData != null ? 1 : 0;

    double iconSize = contentsLength > 0
        ? defaultIconSize / (contentsLength + tileIcon)
        : defaultIconSize;

    if (mapTile.iconData != null) {
      icons.add(Icon(
        mapTile.iconData,
        color: mapTile.iconColor,
        size: iconSize,
      ));
    }

    mapTile.contents.contents.forEach((Entity e) {
      icons.add(Icon(
        e.iconData,
        color: e.color,
        size: iconSize,
      ));
    });

    return GridTile(
      child: Container(
        color: mapTile.color,
        child: GridView.count(
          crossAxisCount: 2,
          children: icons,
        ),
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: () => print('test'),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        RaisedButton(
          child: Icon(
            Icons.arrow_upward,
            color: Colors.black,
          ),
        ),
        RaisedButton(
          child: Icon(
            Icons.arrow_downward,
            color: Colors.black,
          ),
        ),
        RaisedButton(
          child: Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: RaisedButton(
            child: Icon(
              Icons.face,
              color: Colors.black,
            ),
            onPressed: (() {
              setState(() {
                map = new Map();
              });
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return Flexible(
      child: ListView(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(2.0),
                child: ListTile(
                  title: Text('title'),
                  subtitle: Text('Subtitle'),
                  contentPadding: EdgeInsets.all(0.0),
                  dense: true,
                ),
              )),
        ],
      ),
    );
  }
}
