
import 'package:cloud_firestore/cloud_firestore.dart';

class Pegawai {
  final String? id;
  final String? nipPegawai;
  final String? nm_pegawai;
  final String? tglLahirPegawai;
  final String? noTlpPegawai;
  final String? emailPegawai;
  final String? passwordPegawai;

  Pegawai({this.id, this.nipPegawai, this.nm_pegawai, this.tglLahirPegawai, this.noTlpPegawai, this.emailPegawai, this.passwordPegawai});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nipPegawai': nipPegawai,
      'nm_pegawai': nm_pegawai,
      'tglLahirPegawai': tglLahirPegawai,
      'noTlpPegawai': noTlpPegawai,
      'emailPegawai': emailPegawai,
      'passwordPegawai': passwordPegawai,
    };
  }

  Pegawai.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nipPegawai = doc.data()!['nipPegawai'],
        nm_pegawai = doc.data()!['nm_pegawai'],
        tglLahirPegawai = doc.data()!['tglLahirPegawai'],
        noTlpPegawai = doc.data()!['noTlpPegawai'],
        emailPegawai = doc.data()!['emailPegawai'],
        passwordPegawai = doc.data()!['passwordPegawai'];
}
