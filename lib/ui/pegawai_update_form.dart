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
  final _nipCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tanggal_lahirCtrl = TextEditingController();
  final _nomor_teleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _idPegawaiCtrl.text = widget.pegawai.id!;
      _nipCtrl.text = widget.pegawai.nip!;
      _namaPegawaiCtrl.text = widget.pegawai.nama_pegawai!;
      _tanggal_lahirCtrl.text = widget.pegawai.tanggal_lahir!;
      _nomor_teleponCtrl.text = widget.pegawai.nomor_telepon!;
      _emailCtrl.text = widget.pegawai.email!;
      _passwordCtrl.text = widget.pegawai.password!;
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
           nip: _nipCtrl.text,
            nama_pegawai: _namaPegawaiCtrl.text,
            tanggal_lahir: _tanggal_lahirCtrl.text,
            nomor_telepon: _nomor_teleponCtrl.text,
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
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