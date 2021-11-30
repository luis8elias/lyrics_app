import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repository.dart';
import 'package:lyrics_app/data/repositories/dio_groups_repository.dart';
import 'package:lyrics_app/presentation/auth/login/login_page.dart';
import 'package:lyrics_app/presentation/group/create/create_group_page.dart';
import 'package:lyrics_app/presentation/profile/bloc/profile_bloc.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/custom_alert.dart';
import 'package:lyrics_app/utils/navigator.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(
          authRepository: DioAuthRepository(),
          groupsRepository: DioGroupsRepository()),
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


        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (state is SuccessLogout) {
            CustomAlert.showSuccesCustomText(
                context: context, desc: '', title: state.message);
            navigateTo(context, LoginPage());
          } else if (state is LogoutFailed) {
            CustomAlert.showErrorCustomText(
              context: context,
              desc: 'Inténtalo de nuevo',
              title: state.message
            );
          }
        });




        if (state is DataLoaded) {
          var arr = state.user.name.split(" ");
          var initials = arr[0][0] + arr[1][0];
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            floatingActionButton: FloatingActionButton(
              backgroundColor: blueDark,
              mini: true,
              foregroundColor: Colors.white,
              onPressed: () {
                navigateTo(context, CreateGroupPageUI());
              },
              child: SvgPicture.asset(SvgIcons.add, color: Colors.white),
            ),
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
                                textAlign: TextAlign.center, style: h2),
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: IconButton(
                              splashRadius: 25,
                              onPressed: () {
                                BlocProvider.of<ProfileBloc>(context).add(Logout());
                              },
                              icon: Container(
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.logout,
                                  color: red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(left: 25, top: 20),
                      width: double.infinity,
                      child: Text(
                        "Mis Grupos",
                        style: subtitleStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Container(
                      height: kBottomNavigationBarHeight * 7,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          top: 7,
                          left: 7,
                          right: 7,
                        ),
                        itemCount: state.groups.length,
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
                                        onTap: () {},
                                        leading: Container(
                                            decoration: BoxDecoration(
                                              color: blueDark,
                                              borderRadius: BorderRadiusDirectional.all(
                                                Radius.circular(10.0)
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            child:SvgPicture.asset(
                                              SvgIcons.group,
                                              color: Colors.white)
                                            ),
                                        title: Text(
                                          state.groups[index].name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontStyle: FontStyle.normal),
                                        ),

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
                                              color: grey
                                            ),
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
                                  onPressed: () {}
                                ),    
                                _buildIcon(
                                  color: Colors.orange.shade400,
                                  icon: SvgIcons.pencil,
                                  onPressed: () {}
                                ),
                                _buildIcon(
                                  color: green,
                                  icon: SvgIcons.save,
                                  onPressed: () {}
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    )
                  ),
                ],
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
  Widget _buildIcon({
    required String icon,
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
