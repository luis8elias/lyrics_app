import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repository.dart';
import 'package:lyrics_app/presentation/profile/bloc/profile_view_bloc.dart';

import 'package:lyrics_app/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileViewBloc(authRepository: DioAuthRepository()),
      child: ProfileViewUI(),
    );
  }
}

class ProfileViewUI extends StatelessWidget {
  const ProfileViewUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileViewBloc>(context).add(LoadingProfileView());
    
    return BlocBuilder<ProfileViewBloc,ProfileViewState>(
      builder: (context),state){
      is(state is DataLoaded){
        return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 40,
        centerTitle: true,
        title: Text("Mi Perfil", style: titleStyle),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        actions: [],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CircleAvatar(
                        backgroundColor: Colors.brown,
                        child: const Text(
                          'AH',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                        Text('${state.user.name}', textAlign: TextAlign.center),
                  ),
                ],
              ),
              Container(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.logout),
                  label: Text(
                    "Cerrar Sesion",
                    style: TextStyle(fontSize: 14),
                  ),
                  onPressed: () => print("it's pressed"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
      }
    };
    
  }


}
