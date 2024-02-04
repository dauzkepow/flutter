import 'package:flutter/material.dart';
import 'package:tes_googlemap/map_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GoogleMap(),
    );
  }
}

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Center(
          //buat textbutton
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            //ketika diklik muncul ke googlemap
            onPressed: () {
              //buat variabel latitute dan longtitude
              var latitude = -7.552372854481044;
              var longtitude = 110.74272117593743;
              MapUtils.openMap(latitude, longtitude); //buka googlemap
            },
            child: Text(
              'Open Google Map',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ));
  }
}
