import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final Color purple = const Color(0xFF541DDA);
  final Color coral = const Color(0xFFFF5E4D);
  final Color backgroundGray = const Color(0xFFFAFAFA);

  final double sidebarSize = 40;
  final double sidebarSpacerSize = 8;

  @override
  Widget build(BuildContext context) {
    var flamingoDrawer = FlamingoDrawer(
        sidebarSize: sidebarSize,
        sidebarSpacerSize: sidebarSpacerSize,
        purple: purple,
        coral: coral);

    var flamingoBody = FlamingoDashboard(sidebarSize: sidebarSize, purple: purple, coral: coral);

    // var flamingoBody = FlamingoInfoPage();

    var flamingoBodyContainer = FlamingoBodyContainer(
      flamingoBody: flamingoBody,
    );

    var flamingoAppBar = FlamingoAppBar(sidebarSize: sidebarSize);

    return Material(
      color: backgroundGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                flamingoDrawer,
                flamingoBodyContainer,
              ],
            ),
          ),
          flamingoAppBar,
        ],
      ),
    );
  }
}

class FlamingoAppBar extends StatelessWidget {
  const FlamingoAppBar({
    Key key,
    @required this.sidebarSize,
  }) : super(key: key);

  final double sidebarSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: sidebarSize,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: sidebarSize,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image(
                  image: AssetImage("flamingo.png"),
                  semanticLabel:
                      "An icon of a flamingo, the logo of this application.",
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                height: double.infinity,
                width: sidebarSize,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text("Flamingo",
                      style: TextStyle(
                          fontFamily: "Helvetica Neue",
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: sidebarSize,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FlutterLogo(),
              ),
            ),
          ],
        ));
  }
}

class FlamingoBodyContainer extends StatelessWidget {
  const FlamingoBodyContainer({
    Key key,
    @required this.flamingoBody,
  }) : super(key: key);

  final FlamingoBody flamingoBody;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: flamingoBody,
    );
  }
}

class FlamingoBody extends StatelessWidget {
  const FlamingoBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FlamingoDashboard extends FlamingoBody {
  const FlamingoDashboard({
    Key key,
    @required this.sidebarSize,
    @required this.purple,
    @required this.coral,
  }) : super(key: key);

  final double sidebarSize;
  final Color purple;
  final Color coral;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(sidebarSize),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.0, 0.0),
          end: Alignment(1.0, 1.0),
          colors: [purple, coral],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Helvetica Neue",
              fontSize: 40,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 6,
                  offset: Offset(3, 3),
                ), // changes position of shadow
              ],
            ),
          ),
          Text(
            "Welcome to Flamingo! Go to Fleet Management to add your Coral devices.",
            style: TextStyle(
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 6,
                  offset: Offset(3, 3),
                ), // changes position of shadow
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Row(
            children: <Widget>[
              FlamingoCard(),
              SizedBox(width: 20),
              FlamingoCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class FlamingoInfoPage extends FlamingoBody {
  const FlamingoInfoPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Fleet Management",
            style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.white,
            height: 400,
            width: 800,
            child: DataTable(
              sortAscending: true,
              sortColumnIndex: 1,
              
              columns: <DataColumn>[
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Name"), ),
              ],
              rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text("A55F")),
                  DataCell(Text("edge_tpu_1")),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text("A560")),
                  DataCell(Text("edge_tpu_2")),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlamingoDrawer extends StatelessWidget {
  const FlamingoDrawer({
    Key key,
    @required this.sidebarSize,
    @required this.sidebarSpacerSize,
    @required this.purple,
    @required this.coral,
  }) : super(key: key);

  final double sidebarSize;
  final double sidebarSpacerSize;
  final Color purple;
  final Color coral;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: sidebarSize,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: sidebarSpacerSize,
          ),
          Container(
            color: purple,
            height: sidebarSize,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "dashboard.png",
                semanticLabel: "A chart icon represeting the Dashboard page.",
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            color: coral,
            height: sidebarSize,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "coral.png",
                semanticLabel: "The Coral logo.",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlamingoCard extends StatelessWidget {
  const FlamingoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      padding: EdgeInsets.all(8.0),
      height: 120,
      width: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("3.4",
              style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontSize: 56,
                  fontWeight: FontWeight.w100)),
          Text("EDGE TPU (USB)", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
