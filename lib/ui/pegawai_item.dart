
import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;

  const PegawaiItem({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => PegawaiDetail(pegawai: pegawai)));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(pegawai.nama_pegawai!, style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
