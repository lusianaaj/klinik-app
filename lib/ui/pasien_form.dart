
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../ui/pasien_detail.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _idPasienCtrl = TextEditingController();
  final _nomor_rmCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tanggal_lahirCtrl = TextEditingController();
  final _nomor_teleponCtrl = TextEditingController();
  final alamatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            child: Column(
              children: [
                _wTextField(namaField: "Nama Pasien", namaController: _namaPasienCtrl, namaIcon: Icons.room_preferences_rounded),
                SizedBox(height: 10),
                _wTombolSimpan()
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _wTextField({required String namaField, required namaController, required namaIcon}){
    return TextField(
      decoration: InputDecoration(
        labelText: namaField,
        prefixIcon: Icon(namaIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      controller: namaController,
    );
  }

  Widget _wTombolSimpan(){
    return ElevatedButton(
      onPressed: () async {
        Pasien pasien = Pasien(
            // id: _idPasienCtrl.text,
            nomor_rm: _nomor_rmCtrl.text,
            nm_pasien: _namaPasienCtrl.text,
            tanggal_lahir: _tanggal_lahirCtrl.text,
            nomor_telepon: _nomor_teleponCtrl.text,
            alamat: alamatCtrl.text,
        );
        await PasienService().addPasien(pasien).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => PasienDetail(pasien: pasien)));
        });
      },
      child: Text("Simpan")
    );
  }
}
