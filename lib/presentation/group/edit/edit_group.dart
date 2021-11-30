import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/data/repositories/dio_groups_repository.dart';
import 'package:lyrics_app/domain/models/api/group.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

import 'bloc/group_edit_bloc.dart';

class EditGroup extends StatelessWidget {
  const EditGroup({Key? key, required this.group}) : super(key: key);
  final Group group;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GroupEditBloc(groupsRepository: DioGroupsRepository()),
      child: EditGroupUI(
        group: group,
      ),
    );
  }
}

class EditGroupUI extends StatefulWidget {
  EditGroupUI({Key? key, required this.group}) : super(key: key);
  final Group group;
  @override
  _EditGroupUIState createState() => _EditGroupUIState();
}

class _EditGroupUIState extends State<EditGroupUI> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameController.text = widget.group.name;

    BlocProvider.of<GroupEditBloc>(context).add(LoadingEditGroup());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: nameController,
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      hintText: 'La Fiera de Ojinaga',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: blueDark)))),
                      onPressed: () {
                        BlocProvider.of<GroupEditBloc>(context).add(SaveGroup(
                            name: nameController.text,
                            groupId: widget.group.id));
                      },
                      icon: Padding(
                        padding: EdgeInsets.all(7),
                        child: Icon(
                          Icons.save,
                          size: 30,
                        ),
                      ),
                      label: Text(
                        'guardar',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
