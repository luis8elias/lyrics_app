import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/styles.dart';

class CreateLyric extends StatefulWidget {
  const CreateLyric({Key? key}) : super(key: key);

  @override
  _CreateLyricState createState() => _CreateLyricState();
}

class _CreateLyricState extends State<CreateLyric> {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    String value = '1';
    List<S2Choice<String>> options = [
      S2Choice<String>(value: '1', title: 'Cumbia'),
      S2Choice<String>(value: '2', title: 'Corrido'),
      S2Choice<String>(value: '3', title: 'Romántica'),
      S2Choice<String>(value: '4', title: 'Bolero'),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: blueDark,
        label: Text('Guardar'),
        icon: Icon(Icons.save),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Crear Letra",
          style: titleStyle
        ),
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            splashRadius: 25,
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Container(
              child: SvgPicture.asset(
                'assets/arrow-left.svg',
                color: blueDark
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width / 14,
              right: size.width / 14,
              top: size.height / 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nombre',
                    style: titleStyle
                  ),
                ),
                SizedBox(height: 10),
                Material(
                  elevation: 1,
                  shadowColor: shadowColor,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Cuestion Olvidada',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13
                      )
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Género',
                    style: titleStyle
                  ),
                ),
                SizedBox(height: 15),
                Material(
                  elevation: 1,
                  shadowColor: shadowColor,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: SmartSelect<String>.single(
                    choiceStyle: S2ChoiceStyle(
                      spacing: 20,
                      padding: EdgeInsets.all(10),
                    ),
                    
                    choiceLayout: S2ChoiceLayout.list,
                    choiceDirection: Axis.vertical,
                    selectedValue: value,
                    choiceItems: options,
                    choiceType: S2ChoiceType.chips,
                    modalType: S2ModalType.bottomSheet,
                    modalTitle: 'Selecciona un Género',
                    onChange: (state) => setState(() => value = state.value!)
                  )
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Letra',
                    style: titleStyle
                  ),
                ),
                SizedBox(height: 15),
                Material(
                  elevation: 1,
                  shadowColor: shadowColor,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: TextField(
                    maxLines: 16,
                    cursorColor: Theme.of(context).primaryColor,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Escribe tu letra aqui...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13
                      )
                    ),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
