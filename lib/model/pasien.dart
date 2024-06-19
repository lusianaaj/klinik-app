
import 'package:cloud_firestore/cloud_firestore.dart';

class Pasien {
  final String? id;
  final String? noRm;
  final String? nm_pasien;
  final String? tglLahirPasien;
  final String? noTlpPasien;
  final String? alamatPasien;

  Pasien({this.id, this.noRm, this.nm_pasien, this.tglLahirPasien, this.noTlpPasien, this.alamatPasien});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'noRm': noRm,
      'nm_pasien': nm_pasien,
      'tglLahirPasien': tglLahirPasien,
      'noTlpPasien': noTlpPasien,
      'alamatPasien': alamatPasien,
    };
  }

  Pasien.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        noRm = doc.data()!['noRm'],
        nm_pasien = doc.data()!['nm_pasien'],
        tglLahirPasien = doc.data()!['tglLahirPasien'],
        noTlpPasien = doc.data()!['noTlpPasien'],
        alamatPasien = doc.data()!['almatPasien'];
}
