/*
sumber : budaya komputer
https://www.youtube.com/watch?v=Il4-gEZ1o4o
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: tampil_list(),
  ));
}

//buat kelas tampil_list()
class tampil_list extends StatelessWidget {
  /*
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
  */

  //menyimpan data sementara sebelum ditampilkan
  //membuat listmap 2 kolom <string, string>
  final List<Map<String, String>> data_pahlawan = [
    {
      'poto': 'images/pahlawan/agus_salim.jpg',
      'nmpahlawan': 'Agus Salim',
      'keterangan': 'Seorang pahlawan negara'
    },
    {
      'poto': 'images/pahlawan/ahmad_yani.jpg',
      'nmpahlawan': 'Jendral Ahmad Yani',
      'keterangan': 'Salah satu pahlawan revolusi'
    },
    {
      'poto': 'images/pahlawan/ak_gani.jpg',
      'nmpahlawan': 'AK Gani',
      'keterangan': 'Salah satu pahlawan Indonesia'
    },
    {
      'poto': 'images/pahlawan/bung_hatta.jpg',
      'nmpahlawan': 'Bung Hatta',
      'keterangan': 'Wakil Presiden Pertama Indonesia'
    },
    {
      'poto': 'images/pahlawan/hb_ix.jpg',
      'nmpahlawan': 'Hamengku Buwono IX',
      'keterangan': 'Raja Jogja'
    },
    {
      'poto': 'images/pahlawan/moh_natsir.jpg',
      'nmpahlawan': 'Mohammad Natsir',
      'keterangan': 'Salah satu pahlawan Indonesia'
    },
    {
      'poto': 'images/pahlawan/nasution.jpg',
      'nmpahlawan': 'Jendral Nasution',
      'keterangan': 'Salah satu pahlawan revolusi'
    },
    {
      'poto': 'images/pahlawan/patimura.jpg',
      'nmpahlawan': 'Patimura',
      'keterangan': 'Salah satu pahlawan Indonesia'
    },
    {
      'poto': 'images/pahlawan/sudirman.jpg',
      'nmpahlawan': 'Jendral Besar Sudirman',
      'keterangan': 'Pahlawan dan jendral Indonesia'
    },
    {
      'poto': 'images/pahlawan/sukarno.jpg',
      'nmpahlawan': 'Ir. Sukarno',
      'keterangan': 'Presiden Pertama indonesia'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listview Data'),
        ),

        //body - ctrl + spasi
        /* //awal komen
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
          itemCount: data_pahlawan.length, //tampilkan sejumlah data
          separatorBuilder: (context, index) {
            return Divider();
          },

          itemBuilder: (context, index) {
            return ListTile(
              leading:
                  Image.asset(data_pahlawan[index]['poto']!), //tampilkan gambar
              title: Text(
                  data_pahlawan[index]['nmpahlawan']!), //tampilkan data array
              subtitle: Text(
                  data_pahlawan[index]['keterangan']!), //tampilkan text sub

              //ketika diklik buka navigasi baru
              //perlu method untuk menampilkan data array yang dibawa
              //data parameter poto, nmpahlawan, keterangan dibawa ke detailpahlawan
              //buka page baru detail pahlawan
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailpahlawan(
                        //tampilkan data parameter poto, nmpahlawan, keterangan
                        //kirim dana ke class detailpahlawan
                        data_pahlawan[index]['poto']!,
                        data_pahlawan[index]['nmpahlawan']!,
                        data_pahlawan[index]['keterangan']!,
                      ),
                    ));
              },
            );
          },
        ),
        //akhir komen
      ),
    );
  }
}

//tampilkan parameter poto, nmpahlawan, keterangan di class detail pahlawan
class detailpahlawan extends StatelessWidget {
  //menerima data dari listview data_pahlawan
  final String foto;
  final String nama;
  final String ket;

  detailpahlawan(
      this.foto, this.nama, this.ket); //contructor sama dengan nama class

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detail halaman Pahlawan'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)), //beri jarak
              Image.asset(
                '$foto',
                width: 150,
              ), //tampilkan foto

              // beri jarak gambar ke text nama
              SizedBox(
                height: 20,
              ),

              Text(
                '$nama',
                style: TextStyle(fontSize: 30),
              ), //tampilkan nama
              Text(
                '$ket',
                style: TextStyle(fontSize: 15),
              ), //tapilkan keterangan
            ],
          ),
        ),
      ),
    );
  }
}
