import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../ui/pegawai_detail.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _idPegawaiCtrl = TextEditingController();
  final _nipCtrl = TextEditingController();
  final _nama_pegawaiCtrl = TextEditingController();
  final _tanggal_lahirCtrl = TextEditingController();
  final _nomor_teleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            child: Column(
              children: [
                _wTextField(namaField: "Nama Pegawai", namaController: _nama_pegawaiCtrl, namaIcon: Icons.room_preferences_rounded),
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
        Pegawai pegawai = Pegawai(
            // id: _idPegawaiCtrl.text,
            nip: _nipCtrl.text,
            nama_pegawai: _nama_pegawaiCtrl.text,
            tanggal_lahir: _tanggal_lahirCtrl.text,
            nomor_telepon: _nomor_teleponCtrl.text,
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
        );
        await PegawaiService().addPegawai(pegawai).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => PegawaiDetail(pegawai: pegawai)));
        });
      },
      child: Text("Simpan")
    );
  }
}