//tampilkan data API ke listview
//sabar tidak boleh terburu buru

/*
sumber : budaya komputer
https://www.youtube.com/watch?v=pAnYny-4xT0
*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //object http

void main() {
  runApp(MaterialApp(
    home: tampildata_pop(),
  ));
}

//kelas tampil data
class tampildata_pop extends StatefulWidget {
  @override
  State<tampildata_pop> createState() => _tampildata_popState();
}

class _tampildata_popState extends State<tampildata_pop> {
  //buat array[]
  //simpan data sementara di memory sebelum ditampilkan ke listview
  //pondasi database apapun
  List popdata = [];

  //======== api service method fungsi untuk koneksi ke server dan membaca data ========
  /*
    import 'dart:convert';
    import 'package:http/http.dart' as http;
  
    class ApiService {}
  */

  Future<void> baca_data() async {
    String uri = "https://solo.ip1.co.id/komissarAPI/Servercommand/testapi";
    //penanganan handling kalau terjadi kesalahan konek server
    try {
      //variabel yang menampung koneksi
      final respon = await http.get(Uri.parse(uri));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        //melakukan sinkronisasi (perubahan data)
        setState(() {
          popdata = data;
        });
      }
    } catch (e) {
      //mengetahui kalau ada masalah dengan koneksi ke server
      print(e);
    }
  }

  //baca fungsi yang sudah dibuat
  //dikerjakan sekali setelah bertemu dengan tampil popdata
  @override
  void initState() {
    baca_data(); //ambil fungsi baca data
    super.initState();
  }
  //======== batas method ========`

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listview Data POP'),
        ),
        body: ListView.builder(
          itemCount: popdata.length, //tampilkan sejumlah data
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(popdata[index]['id_kota'] +
                  " --> " +
                  popdata[index]['nama_pop']),
              subtitle:
                  Text(popdata[index]['lat'] + "," + popdata[index]['long']),
            );
          },
        ),
      ),
    );
  }
}
