
import 'package:flutter/material.dart';
import '../../model/pasien.dart';
import 'pasien_detail.dart';

class PasienItemPage extends StatelessWidget {
  final Pasien pasien;

  const PasienItemPage({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => PasienDetail(pasien: pasien)));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(pasien.nm_pasien!, style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
