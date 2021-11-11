import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repositry.dart';
import 'package:lyrics_app/presentation/home/bloc/home_bloc.dart';
import 'package:lyrics_app/presentation/shared/custom_card.dart';
import 'package:lyrics_app/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(authRepository: DioAuthRepository()),
      child: HomePageUI(),
    );
  }
}

class HomePageUI extends StatelessWidget {
  const HomePageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<HomeBloc>(context).add(
      LoadingHome()
    );


    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        if(state is DataLoaded){

          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Hola ${state.user.name}',
                style: TextStyle(color: blueDark, fontSize: titleSize,fontWeight: FontWeight.bold)),
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DashboardCard(
                  text: 'Canciones',
                  value: '15',
                  icon: 'music-note',
                ),
                DashboardCard(
                  text: 'Géneros',
                  value: '23',
                  icon: 'collection',
                ),
              ],
            ),
          );
          
        }else{
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
