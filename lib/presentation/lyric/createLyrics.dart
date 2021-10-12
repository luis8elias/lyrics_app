import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Letra",
            style: TextStyle(color: Color(0xFF2F80ED), fontSize: 28)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          // * @ columna del formulario
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Nombre',
                  style: TextStyle(
                      color: Color(0xFF2F80ED), height: 1.5, fontSize: 20),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Genero',
                    style: TextStyle(
                    color: Color(0xFF2F80ED), height: 2.5, fontSize: 20)),
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
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
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
                  maxLines: 12,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: ElevatedButton(
                    // ! el boton no anda jalando si le picas
                    onPressed: () {},
                    child: const Text('Guardar'),
                  ))
            ],
          )),
    );
  }
}
