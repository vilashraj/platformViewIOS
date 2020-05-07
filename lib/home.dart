import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var platform = const MethodChannel('com.example.platformView');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Platform View Demo"),),
      body: getBody(),
    );
  }

  Widget getBody(){
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            width: 200,
            height: 200,
            child: UiKitView(viewType: "FluffView"),
          ),
        ),

        FlatButton(
          child: Text("Change Color"),
          onPressed: () async{
            final bool result = await platform.invokeMethod('changeColor');

          },
        ),

      ],
    );
  }
}
