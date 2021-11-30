import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/data/repositories/dio_groups_repository.dart';
import 'package:lyrics_app/data/repositories/hive_config_repository.dart';
import 'package:lyrics_app/presentation/wrapper/wrapper_page.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/custom_alert.dart';
import 'package:lyrics_app/utils/navigator.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

import 'bloc/create_group_bloc.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateGroupBloc(
          groupsRepository: DioGroupsRepository(),
          configRepository: HiveConfigRepository()),
      child: CreateGroupPageUI(),
    );
  }
}

class CreateGroupPageUI extends StatefulWidget {
  CreateGroupPageUI({Key? key}) : super(key: key);

  @override
  _CreateGroupPageUIState createState() => _CreateGroupPageUIState();
}

class _CreateGroupPageUIState extends State<CreateGroupPageUI> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();

  bool codeEnabled = true;
  bool nameEnabled = true;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<CreateGroupBloc>(context);

    return BlocBuilder<CreateGroupBloc, CreateGroupState>(
      builder: (context, state) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (state is GroupCreated) {
            CustomAlert.showSuccesCustomText(
                context: context, desc: '', title: state.message);
            navigateReplacement(context, WrapperPage(pageIndex: 0));
          } else if (state is GroupNotCreated) {
            CustomAlert.showErrorCustomText(
                context: context,
                desc: 'Inténtalo de nuevo',
                title: state.message);
          }
        });

        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text("Crear Grupo", style: titleStyle),
            leadingWidth: 50,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: IconButton(
                splashRadius: 25,
                onPressed: () {},
                icon: Container(
                  child: SvgPicture.asset(SvgIcons.arrowLeft, color: blueDark),
                ),
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 14, right: 14, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Nombre', style: titleStyle),
                  ),
                  SizedBox(height: 10),
                  Material(
                    elevation: 1,
                    shadowColor: shadowColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: TextField(
                      enabled: nameEnabled,
                      controller: nameController,
                      onChanged: (str){
                        setState(() {

                          if(str.isEmpty){
                            codeEnabled = true;
                          }else{
                            codeEnabled = false;
                          }
                          
                        });
                      },
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          hintText: 'Las Fieras de Ojinaga',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'O',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Unirse por Codigo', style: titleStyle),
                  ),
                  SizedBox(height: 10),
                  Material(
                    elevation: 1,
                    shadowColor: shadowColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: TextField(
                      enabled: codeEnabled,
                      controller: codeController,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Escribe tu código de asosiación',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 13)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(blueDark),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide.none))),
                          onPressed: () => _bloc
                              .add(CreateGroup(name: nameController.text)),
                          icon: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.save,
                              size: 30,
                            ),
                          ),
                          label: Text(
                            'Guardar',
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
