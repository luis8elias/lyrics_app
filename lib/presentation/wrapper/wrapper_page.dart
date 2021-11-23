import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/presentation/home/home_page.dart';
import 'package:lyrics_app/presentation/lyric/list/lyrics_list_page.dart';
import 'package:lyrics_app/presentation/profile/profile_page.dart';
import 'package:lyrics_app/presentation/shared/custom_navigation_bar.dart';
import 'package:lyrics_app/presentation/wrapper/bloc/wrapper_bloc.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({Key? key, required this.pageIndex}) : super(key: key);

  final pageIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WrapperBloc(index: pageIndex),
      child: WrapperPageUI(),
    );
  }
}

class WrapperPageUI extends StatelessWidget {
  const WrapperPageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<WrapperBloc>(context);

    return BlocBuilder<WrapperBloc, IndexChangedState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(5, 5),
                  color: Color(0xffD6D7D8),
                  blurRadius: 15)
            ]),
            child: CustomNavigationBar(
              index: state.currentIndex,
              onIndexSelected: (index) {
                _bloc.add(IndexChangedEvent(index: index));
              },
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: IndexedStack(
                index: state.currentIndex,
                children: [
                  HomePage(),
                  LyricsListPage(),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.orange,
                  ),
                  ProfilePage()
                ],
              )),
            ],
          ),
        );
      },
    );
  }
}
