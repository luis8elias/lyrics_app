import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      // 'E',
      // 'F',
      // 'G',
      // 'H'
    ];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(
        title: Text("        Canciones",
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

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.blue[200],
            ),
            //Todo @ aqui entra el texto de los contenedores  de las canciones
            child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(15)),
              //   color: Colors.white,
              // ),
              child: ListTile(
                leading: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      Icons.music_note,
                      size: 28,
                      color: Colors.green,
                    )),
                title: Text(
                  'el ansioso',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
                ),
                subtitle: Text('Norteña'),
                trailing: GestureDetector(
                    onTap: () {
                      print("opciones de cancion");
                    },
                    child: Icon(
                      Icons.more_vert,
                      size: 30,
                      color: Colors.black,
                    )),
                onTap: () {
                  print('seleccion de cancion');
                },
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
