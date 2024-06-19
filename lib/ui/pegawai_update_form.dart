import 'package:flutter/material.dart';
import '../service/pegawai_service.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _idPegawaiCtrl = TextEditingController();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tglLahirPegawaiCtrl = TextEditingController();
  final _noTlpPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _idPegawaiCtrl.text = widget.pegawai.id!;
      _nipPegawaiCtrl.text = widget.pegawai.nipPegawai!;
      _namaPegawaiCtrl.text = widget.pegawai.nm_pegawai!;
      _tglLahirPegawaiCtrl.text = widget.pegawai.tglLahirPegawai!;
      _noTlpPegawaiCtrl.text = widget.pegawai.noTlpPegawai!;
      _emailPegawaiCtrl.text = widget.pegawai.emailPegawai!;
      _passwordPegawaiCtrl.text = widget.pegawai.passwordPegawai!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            key: _formKey,
              child: Column(
                children: [
                  _wTextField(namaField: "Nama Pegawai", namaController: _namaPegawaiCtrl, namaIcon: Icons.room_preferences_rounded),
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
          Pegawai pegawai = Pegawai(
            id: _idPegawaiCtrl.text,
            nipPegawai: _nipPegawaiCtrl.text,
            nm_pegawai: _namaPegawaiCtrl.text,
            tglLahirPegawai: _tglLahirPegawaiCtrl.text,
            noTlpPegawai: _noTlpPegawaiCtrl.text,
            emailPegawai: _emailPegawaiCtrl.text,
            passwordPegawai: _passwordPegawaiCtrl.text,
          );
          await PegawaiService().updatePegawai(pegawai).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PegawaiDetail(pegawai: pegawai)));
          });
        },
        child: Text("Ubah")
    );
  }
}