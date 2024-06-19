
import 'package:flutter/material.dart';
import '../ui/pegawai_form.dart';
import '../ui/pegawai_item.dart';
import '../widget/sidebar.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  PegawaiService _pegawaiService = PegawaiService();
  Future<List<Pegawai>>? _pegawaiList;
  List<Pegawai>? _retrievedPegawaiList;

  Future<void> _initRetrieval() async {
    _pegawaiList = _pegawaiService.retrievePegawai();
    _retrievedPegawaiList = await _pegawaiService.retrievePegawai();
  }

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _initRetrieval();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: FutureBuilder(
          future: _pegawaiList,
          builder: (BuildContext context, AsyncSnapshot<List<Pegawai>> snapshot) {
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: _retrievedPegawaiList!.length,
              itemBuilder: (context, index){
                var pegawai = _retrievedPegawaiList![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.redAccent,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.delete, color: Colors.white,),
                  ),
                  onDismissed: (direction){
                    _pegawaiService.deletePegawai(pegawai.id!);
                  },
                  direction: DismissDirection.endToStart,
                  child: PegawaiItem(pegawai: pegawai),
                );
              }
            );
          }
        ),
      ),
    );
  }
}
