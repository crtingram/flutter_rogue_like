import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
      child: GridView.extent(maxCrossAxisExtent: screenWidth / 9, children: []),
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
