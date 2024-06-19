
import 'package:cloud_firestore/cloud_firestore.dart';

class Pasien {
  final String? idPasien;
  final String? nomor_rm;
  final String? nm_pasien;
  final String? tanggal_lahir;
  final String? nomor_telepon;
  final String? alamat;

  Pasien({this.idPasien, this.nomor_rm, this.nm_pasien, this.tanggal_lahir, this.nomor_telepon, this.alamat});

  Map<String, dynamic> toMap() {
    return {
      'idPasien': idPasien,
      'nomor_rm': nomor_rm,
      'nm_pasien': nm_pasien,
      'tanggal_lahir': tanggal_lahir,
      'nomor_telepon': nomor_telepon,
      'alamat': alamat,
    };
  }

  Pasien.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : idPasien= doc.data()!['idPasien'],
        nomor_rm = doc.data()!['nomor_rm'],
        nm_pasien = doc.data()!['nm_pasien'],
        tanggal_lahir = doc.data()!['tanggal_lahir'],
        nomor_telepon = doc.data()!['nomor_telepon'],
        alamat = doc.data()!['alamat'];
}
