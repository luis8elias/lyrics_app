// ignore_for_file: implementation_imports

import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/data/repositories/dio_genres_repository.dart';
import 'package:lyrics_app/data/repositories/dio_lyrics_repository.dart';
import 'package:lyrics_app/globals.dart';
import 'package:lyrics_app/presentation/lyric/create/bloc/create_lyric_bloc.dart';
import 'package:lyrics_app/presentation/wrapper/wrapper_page.dart';
import 'package:lyrics_app/styles.dart';
import 'package:awesome_select/src/model/chosen.dart';
import 'package:lyrics_app/utils/custom_alert.dart';
import 'package:lyrics_app/utils/navigator.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

class CreateLyricPage extends StatelessWidget {
  const CreateLyricPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateLyricBloc(
        genresRepository: DioGenresRepository(),
        lyricsRepository: DioLyricsRepository(),
      ),
      child: CreateLyricUI(),
    );
  }
}

class CreateLyricUI extends StatefulWidget {
  const CreateLyricUI({Key? key}) : super(key: key);

  @override
  _CreateLyricUIState createState() => _CreateLyricUIState();
}

class _CreateLyricUIState extends State<CreateLyricUI> {
  final nameController = TextEditingController();
  final lyricController = TextEditingController();
  String genreValue = '';

  @override
  void dispose() {
    nameController.dispose();
    lyricController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<CreateLyricBloc>(context).add(LoadingCreateLyric());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CreateLyricBloc, CreateLyricState>(
      builder: (context, state) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (state is LyricCreated) {
            CustomAlert.showSuccesCustomText(
                context: context, desc: '', title: state.message);
          } else if (state is LyricNotCreated) {
            CustomAlert.showErrorCustomText(
                context: context,
                desc: 'Int??ntalo de nuevo',
                title: state.message);
          }
        });

        if (state is DataLoaded) {
          List<S2Choice<String>> options = state.genres
              .map((genre) => S2Choice<String>(
                  value: genre.id.toString(), title: genre.name))
              .toList();

          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                BlocProvider.of<CreateLyricBloc>(context).add(
                  SaveLyric(
                    genre: genreValue,
                    lyric: lyricController.text,
                    name: nameController.text,
                    groupId: Globals.groupId
                  )
                );
              },
              backgroundColor: blueDark,
              label: Text('Guardar'),
              icon: Icon(Icons.save),
            ),
            appBar: AppBar(
              centerTitle: true,
              title: Text("Crear Letra", style: titleStyle),
              leadingWidth: 50,
              leading: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  splashRadius: 25,
                  onPressed: () {
                    navigateTo(context, WrapperPage(pageIndex: 1));
                  },
                  icon: Container(
                    child:
                        SvgPicture.asset(SvgIcons.arrowLeft, color: blueDark),
                  ),
                ),
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0,
            ),
            body: SingleChildScrollView(
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
                            hintText: 'Cuestion Olvidada',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('G??nero', style: titleStyle),
                    ),
                    SizedBox(height: 15),
                    Material(
                        elevation: 1,
                        shadowColor: shadowColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: SmartSelect<String>.single(
                            modalConfig: S2ModalConfig(
                              useFilter: false,
                              filterAuto: false
                            ),
                            choiceStyle: S2ChoiceStyle(
                              spacing: 20,
                              padding: EdgeInsets.all(10),
                            ),
                            choiceLayout: S2ChoiceLayout.list,
                            choiceDirection: Axis.vertical,
                            selectedValue: genreValue,
                            placeholder: '',
                            choiceItems: options,
                            choiceType: S2ChoiceType.chips,
                            modalType: S2ModalType.bottomSheet,
                            modalTitle: 'Selecciona un G??nero',
                            onChange: (S2SingleSelected<String?> state) =>
                                genreValue = state.value!)),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Letra', style: titleStyle),
                    ),
                    SizedBox(height: 15),
                    Material(
                      elevation: 1,
                      shadowColor: shadowColor,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: TextField(
                        controller: lyricController,
                        maxLines: 16,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        decoration: InputDecoration(
                            hintText: 'Escribe tu letra aqui...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: ligthBlue,
                strokeWidth: 5.0,
                valueColor: AlwaysStoppedAnimation<Color>(blueDark),
              ),
            ),
          );
        }
      },
    );
  }
}
