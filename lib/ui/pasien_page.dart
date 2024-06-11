import 'package:flutter/material.dart';
import '../widget/sidebar.dart';
import '../model/pegawai.dart';
import '../model/pasien.dart';
import 'pegawai_detail.dart';
import 'pasien_detail.dart';
import 'pegawai_item.dart';
import 'pasien_item.dart';
import 'pegawai_form.dart';
import 'pasien_form.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: const Text("Data RS")),
      body: ListView(
        children: [
          GestureDetector(
            child: Card(
              child: ListTile(
                title: const Text("Pasien"),
              ),
            ),
            onTap: () {
              Pasien pasien = new Pasien(namaPasien: "Lusiana Alam Jembar");
              idPasien:
              '7829';
              nomor_rm:
              '19221450';
              tanggal_lahir:
              '18 Januari 2004';
              nomor_telepon:
              '085750537829';
              alamat:
              'Gang Langgar';
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PasienDetail(pasien: pasien)));
            },
          ),
        ],
      ),
    );
  }
}
