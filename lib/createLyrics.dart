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
        title: Text("Crear Letra"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          // * @ columna del formulario
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Nombre'),
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Genero'),
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Letra'),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  maxLines: 10,
                ),
              ),
              // TextField(

              //   decoration: InputDecoration(
              //     hintText: 'ingresa la letra aqui',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(20))
              //     ),
              //   ),
              // ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                    // ! el boton no anda jalando si le picas
                    onPressed: () {},
                    child: const Text('Agregar'),
                  ))
            ],
          )),
    );
  }
}
