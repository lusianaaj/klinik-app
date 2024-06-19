
import 'package:flutter/material.dart';
import '../service/pasien_service.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;
  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _idPasienCtrl = TextEditingController();
  final _nomor_rmCtrl = TextEditingController();
  final _nm_pasienCtrl = TextEditingController();
  final _tanggal_lahirCtrl = TextEditingController();
  final _nomor_teleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _idPasienCtrl.text = widget.pasien.idPasien!;
      _nomor_rmCtrl.text = widget.pasien.nomor_rm!;
      _nm_pasienCtrl.text = widget.pasien.nm_pasien!;
      _tanggal_lahirCtrl.text = widget.pasien.tanggal_lahir!;
      _nomor_teleponCtrl.text = widget.pasien.nomor_telepon!;
      _alamatCtrl.text = widget.pasien.alamat!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubah Pasien")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            key: _formKey,
              child: Column(
                children: [
                  _wTextField(namaField: "Nama Pasien", namaController: _nm_pasienCtrl, namaIcon: Icons.room_preferences_rounded),
                  SizedBox(height: 10),
                  _wTombolUbah()
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

  Widget _wTombolUbah(){
    return ElevatedButton(
        onPressed: () async {
          Pasien pasien = Pasien(
            idPasien: _idPasienCtrl.text,
            nomor_rm: _nomor_rmCtrl.text,
            nm_pasien: _nm_pasienCtrl.text,
            tanggal_lahir: _tanggal_lahirCtrl.text,
            nomor_telepon: _nomor_teleponCtrl.text,
            alamat: _alamatCtrl.text,
          );
          await PasienService().updatePasien(pasien).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PasienDetail(pasien: pasien)));
          });
        },
        child: Text("Ubah")
    );
  }
}
