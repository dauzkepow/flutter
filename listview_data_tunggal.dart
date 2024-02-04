/*
sumber : Budaya Komputer
https://www.youtube.com/watch?v=_mTRSTIIkSo
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: tampil_list(),
  ));
}

//buat kelas tampil_list()
class tampil_list extends StatelessWidget {
  //data tunggal
  //data dalam bentuk array
  final data_buah = [
    "Pepaya",
    "Pisang",
    "Mangga",
    "Jambu",
    "Durian",
    "Salak",
    "Semangka",
    "Melon",
    "Nanas",
    "Apel",
    "Markisa",
    "Salak",
    "Rambutan",
    "Duku"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listview Data'),
        ),

        //body - ctrl + spasi
        /*//awal komen
        //contoh Listview.builder
        body: ListView.builder(
          itemCount: data_buah.length, //tampilkan sejumlah data
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset('images/tower.png'), //tampilkan gambar
              title: Text(data_buah[index]), //tampilkan data array
              subtitle: Text("Keterangan setiap gambar"), //tampilkan text sub
            );
          },
        ),
        */ //akhir komen

        //contoh Listview.separated
        //awal komen
        body: ListView.separated(
          //itemCount: data_buah.length, //tampilkan sejumlah data
          itemCount: data_buah.length, //tampilkan sejumlah data
          separatorBuilder: (context, index) {
            return Divider();
          },

          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset('images/tower.png'), //tampilkan gambar
              title: Text(data_buah[index]), //tampilkan data array
              subtitle: Text("Keterangan setiap gambar"), //tampilkan text sub
            );
          },
        ),
        //akhir komen
      ),
    );
  }
}
