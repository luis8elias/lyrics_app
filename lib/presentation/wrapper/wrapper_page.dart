import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/presentation/shared/custom_navigation_bar.dart';
import 'package:lyrics_app/presentation/wrapper/bloc/wrapper_bloc.dart';
import 'package:lyrics_app/styles.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WrapperBloc(),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomNavigationBar(
            index: state.currentIndex,
            onIndexSelected: (index) {
              _bloc.add(IndexChangedEvent(index: index));
            },
          ),
          floatingActionButton: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: blueDark),
              child: FloatingActionButton(
                onPressed: () {
                  _bloc.add(IndexChangedEvent(index: 2));
                },
                elevation: 0,
                highlightElevation: 0,
                foregroundColor: Colors.white,
                splashColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/search.svg',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: IndexedStack(
                index: state.currentIndex,
                children: [
                  Container(
                    color: Colors.purple,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.orange,
                  ),
                  Container(
                    color: Colors.pink,
                  )
                ],
              )),
            ],
          ),
        );
      },
    );
  }
}
