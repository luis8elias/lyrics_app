import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(
        title: Text("Canciones",
            style: TextStyle(color: Colors.white, fontSize: 28)),
        leading: GestureDetector(
          onTap: () {
            print('si jala el ontap salu2');
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF2F80ED),
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(7),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: Colors.cyan[100],
            //Todo @ aqui entra el texto de los contenedores  de las canciones
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
