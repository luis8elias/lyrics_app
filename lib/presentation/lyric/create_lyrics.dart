import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Crear Letra",
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
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          // * @ columna del formulario
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
               TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                labelText: 'Nombre'),
              ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Genero',
                      style: TextStyle(
                          color: Color(0xFF2F80ED), height: 2.5, fontSize: 20)),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  width: 900,
                  height: 50.0,
                  child: DropdownButton(
                    
                    value: dropdownValue,
                    icon: Container(
                    width: 25,
                    height: 25,
                    child:SvgPicture.asset(
                      'assets/arrow-down.svg',
                      color: Colors.grey,
                    ),
                  ),
                    iconSize: 32,
                    isExpanded: true,
                    style: TextStyle(color: Color(0xFF2F80ED), fontSize: 20.0),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Color(0xFF2F80ED),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Letra',
                      style: TextStyle(
                          color: Color(0xFF2F80ED), height: 2.5, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    maxLines: 16,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 120),
                    child: SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          print('guardar formulario');
                        },
                        child: const Text('Guardar',
                            style: TextStyle(fontSize: 20)),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: BorderSide(color: Colors.blue)))),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
