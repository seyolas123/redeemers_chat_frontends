import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Redeemers Chat';
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: title,
      routes: {
        '/nigeria': (_) =>
        new WebviewScaffold(
            resizeToAvoidBottomInset: true,
            url: "https://redeemerschat.org/ng",
            appBar: new AppBar(
            title: const Text('Redeemers Chat - Nigeria'),
          ),
          withZoom: false,
          withLocalStorage: true,
          hidden: true,
          ),
          
        
        '/gambia': (_) =>
        new WebviewScaffold(
          resizeToAvoidBottomInset: true,
          url: "https://redeemerschat.org/gambia",
          //gestureRecognizers: Set()
          appBar: new AppBar(
            title: const Text('Redeemers Chat - Gambia'),
          ),

          withZoom: false,
          withLocalStorage: true,
          hidden: true,
        ),

        '/uk': (_) =>
        new WebviewScaffold(
          resizeToAvoidBottomInset: true,
          url: "https://redeemerschat.org/uk",
          appBar: new AppBar(
            title: const Text('Redeemers Chat - Uk'),
          ),
          withZoom: false,
          withLocalStorage: true,
          hidden: true,
        )
      },

      home: new MyAppHomePage(),
    );
  }
}

class MyAppHomePage extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyAppHomePage> {

final flutterWebviewPlugin = new FlutterWebviewPlugin();

@override
void initState() {
  super.initState();
  flutterWebviewPlugin.onScrollYChanged.listen((double yOffset) {
    
  } );
}  

  void _opennigeria() {
    Navigator.of(context).pushNamed('/nigeria');
  }

  void _opengambia() {
    Navigator.of(context).pushNamed('/gambia');
  }

  void _openuk() {
    Navigator.of(context).pushNamed('/uk');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text("Redeemers Chat"),
          ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Select a Country'),

            ),
            ListTile(
                title: Text('Nigeria'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  _opennigeria();
                }
            ),
            ListTile(
              title: Text('Gambia'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _opengambia();
              },
            ),
            ListTile(
              title: Text('UK'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                _openuk();
              },
            ),
          ],
        ),
    );
  }

}