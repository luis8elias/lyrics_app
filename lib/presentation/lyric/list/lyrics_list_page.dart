import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyrics_app/data/repositories/dio_lyrics_repository.dart';
import 'package:lyrics_app/presentation/lyric/create/create_lyric_page.dart';
import 'package:lyrics_app/presentation/lyric/edit/edit_lyric_page.dart';
import 'package:lyrics_app/presentation/lyric/see/see_lyric_page.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/custom_alert.dart';
import 'package:lyrics_app/utils/debouncer.dart';
import 'package:lyrics_app/utils/navigator.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

import 'bloc/lyrics_list_bloc.dart';

class LyricsListPage extends StatelessWidget {
  const LyricsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LyricsListBloc(lyricsRepository: DioLyricsRepository()),
      child: LyricsListPageUI(),
    );
  }
}

class LyricsListPageUI extends StatefulWidget {
  LyricsListPageUI({Key? key}) : super(key: key);

  @override
  _LyricsListPageUIState createState() => _LyricsListPageUIState();
}

class _LyricsListPageUIState extends State<LyricsListPageUI> {
  ScrollController scrollController = new ScrollController();
  TextEditingController searchController = new TextEditingController();

  Debouncer debouncer = new Debouncer();

  @override
  void initState() {
    super.initState();

    /*  scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 300) {}
    }); */
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    LyricsListBloc _bloc = BlocProvider.of<LyricsListBloc>(context);

    _bloc.add(LoadingLyrics(page: 1));

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: blueDark,
          mini: false,
          foregroundColor: Colors.white,
          onPressed: () {
            navigateTo(context, CreateLyricPage());
          },
          child: SvgPicture.asset(SvgIcons.add, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 40,
          centerTitle: true,
          title: Text("Letras", style: titleStyle),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                splashRadius: 25,
                onPressed: () {},
                icon: Container(
                  width: 25,
                  height: 25,
                  child: SvgPicture.asset(SvgIcons.save, color: green),
                ),
              ),
            )
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width / 14,
                      right: size.width / 14,
                      top: size.height / 40),
                  child: Material(
                    elevation: 1,
                    shadowColor: shadowColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        debouncer.run(() {
                          if (searchController.text.isEmpty) {
                            _bloc.add(LoadingLyrics(page: 1));
                          } else {
                            _bloc
                                .add(SearchLyric(lyric: searchController.text));
                          }
                        });
                      },
                      autofocus: false,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          hintText: 'Buscar Letra',
                          suffixIcon: Container(
                            padding: EdgeInsets.all(15),
                            child: SvgPicture.asset(
                              SvgIcons.searchNormal,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<LyricsListBloc, LyricsListState>(
                    builder: (context, state) {
                  WidgetsBinding.instance?.addPostFrameCallback((_) {
                    if (state is LyricDeleted) {
                      CustomAlert.showSuccesCustomText(
                          context: context, desc: '', title: state.message);
                    } else if (state is LyricNotDeleted) {
                      CustomAlert.showErrorCustomText(
                          context: context,
                          desc: 'Inténtalo de nuevo',
                          title: state.message);
                    }
                  });

                  if (state is DataLoaded) {
                    return Container(
                      height: size.height,
                      child: ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.only(
                            left: 7,
                            right: 7,
                            top: 7,
                            bottom: kBottomNavigationBarHeight * 5),
                        itemCount: state.lyrics.length,
                        itemBuilder: (BuildContext context, int index) {
                          bool slidableOpened = false;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.18,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  child: Center(
                                    child: Builder(builder: (newContext) {
                                      return ListTile(
                                        onTap: () {
                                          navigateTo(
                                              context,
                                              SeeLyricPage(
                                                  lyric: state.lyrics[index]));
                                        },
                                        leading: Container(
                                            decoration: BoxDecoration(
                                              color: blueDark,
                                              borderRadius:
                                                  BorderRadiusDirectional.all(
                                                      Radius.circular(10.0)),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            child: SvgPicture.asset(
                                                SvgIcons.musicNoteSolid,
                                                color: Colors.white)),
                                        title: Text(
                                          state.lyrics[index].name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontStyle: FontStyle.normal),
                                        ),
                                        subtitle: Text(
                                            state.lyrics[index].genre.name),
                                        trailing: Container(
                                          padding: EdgeInsetsDirectional.all(5),
                                          width: 40,
                                          height: 40,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (slidableOpened) {
                                                Slidable.of(newContext)
                                                    ?.close();
                                                slidableOpened = false;
                                              } else {
                                                Slidable.of(newContext)?.open(
                                                  actionType:
                                                      SlideActionType.secondary,
                                                );
                                                slidableOpened = true;
                                              }
                                            },
                                            child: SvgPicture.asset(
                                                SvgIcons.dots,
                                                color: grey),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              secondaryActions: <Widget>[
                                _buildIcon(
                                    color: Color(0xffFF4D4D),
                                    icon: SvgIcons.trash,
                                    onPressed: () {
                                      _bloc.add(DeleteLyric(
                                          lyricId: state.lyrics[index].id));
                                    }),
                                _buildIcon(
                                    color: Colors.orange.shade400,
                                    icon: SvgIcons.pencil,
                                    onPressed: () {
                                      navigateTo(
                                          context,
                                          EditLyricPage(
                                              lyric: state.lyrics[index]));
                                    }),
                                _buildIcon(
                                    color: green,
                                    icon: SvgIcons.save,
                                    onPressed: () {}),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is LyricsNotfound) {
                    return Container(
                      height: size.height - (275 + kBottomNavigationBarHeight),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              SvgIcons.notResults,
                              color: blueDark,
                              height: 70,
                            ),
                            SizedBox(height: 20),
                            Text(state.message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ))
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: size.height,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: kBottomNavigationBarHeight * 5),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: ligthBlue,
                            strokeWidth: 5.0,
                            valueColor: AlwaysStoppedAnimation<Color>(blueDark),
                          ),
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ));
  }

  Widget _buildIcon(
      {required String icon,
      required VoidCallback onPressed,
      required Color color}) {
    return IconSlideAction(
      color: Colors.transparent,
      iconWidget: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: SvgPicture.asset(icon, color: Colors.white),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
