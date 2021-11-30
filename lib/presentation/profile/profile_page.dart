import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repository.dart';
import 'package:lyrics_app/presentation/profile/bloc/profile_bloc.dart';


import 'package:lyrics_app/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(authRepository: DioAuthRepository()),
      child: ProfilePageUI(),
    );
  }
}

class ProfilePageUI extends StatelessWidget {
  const ProfilePageUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    BlocProvider.of<ProfileBloc>(context).add(LoadingProfile());
    
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {

        if (state is DataLoaded){

         var arr = state.user.name.split(" ");
         var initials = arr[0][0]+ arr[1][0];
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
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: 50,
                              height: 50,
                              child: CircleAvatar(
                                backgroundColor: ligthBlue,
                                child: Text(
                                  initials,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text('${state.user.name}',
                              textAlign: TextAlign.center,
                              style: h2
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                       padding: const EdgeInsets.only(left: 25),
                      width: double.infinity,
                      child: Text(
                        "Mis Grupos",
                        style: subtitleStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView()
                  ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      width: 180,
                      height: 150,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.logout),
                        label: Text(
                          "Cerrar Sesión",
                          style: TextStyle(fontSize: 14),
                        ),
                        onPressed: () => print("it's pressed"),
                        style: ElevatedButton.styleFrom(
                          primary: blueDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
