
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
  final _noRmCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tglLahirPasienCtrl = TextEditingController();
  final _noTlpPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _idPasienCtrl.text = widget.pasien.id!;
      _noRmCtrl.text = widget.pasien.noRm!;
      _namaPasienCtrl.text = widget.pasien.nm_pasien!;
      _tglLahirPasienCtrl.text = widget.pasien.tglLahirPasien!;
      _noTlpPasienCtrl.text = widget.pasien.noTlpPasien!;
      _alamatPasienCtrl.text = widget.pasien.alamatPasien!;
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
                  _wTextField(namaField: "Nama Pasien", namaController: _namaPasienCtrl, namaIcon: Icons.room_preferences_rounded),
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
            id: _idPasienCtrl.text,
            noRm: _noRmCtrl.text,
            nm_pasien: _namaPasienCtrl.text,
            tglLahirPasien: _tglLahirPasienCtrl.text,
            noTlpPasien: _noTlpPasienCtrl.text,
            alamatPasien: _alamatPasienCtrl.text,
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
