
import 'package:cloud_firestore/cloud_firestore.dart';

class Pegawai {
  final String? id;
  final String? nip;
  final String? nama_pegawai;
  final String? tanggal_lahir;
  final String? nomor_telepon;
  final String? email;
  final String? password;

  Pegawai({this.id, this.nip, this.nama_pegawai, this.tanggal_lahir, this.nomor_telepon, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nip': nip,
      'nama_pegawai': nama_pegawai,
      'tanggal_lahir': tanggal_lahir,
      'nomor_telepon': nomor_telepon,
      'email': email,
      'password': password,
    };
  }

  Pegawai.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nip = doc.data()!['nip'],
        nama_pegawai = doc.data()!['nama_pegawai'],
        tanggal_lahir = doc.data()!['tanggal_lahir'],
        nomor_telepon = doc.data()!['nomor_telepon'],
        email = doc.data()!['email'],
        password = doc.data()!['password'];
}
