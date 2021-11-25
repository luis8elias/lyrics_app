import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/data/repositories/dio_genres_repository.dart';
import 'package:lyrics_app/presentation/genre/bloc/genre_list_bloc.dart';
import 'package:lyrics_app/styles.dart';

class GenreListPage extends StatelessWidget {
  const GenreListPage({ Key? key }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GenreListBloc(genresRepository: DioGenresRepository()),
      child: GenreListPageUI(),
    );
  }
}

class GenreListPageUI extends StatelessWidget {
  const GenreListPageUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     BlocProvider.of<GenreListBloc>(context).add(LoadingGenres());


    return BlocBuilder<GenreListBloc, GenreListState>(
      builder: (context, state) {

        if(state is DataLoaded){
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar:  AppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 40,
              centerTitle: true,
              title: Text("Géneros", style: titleStyle),
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0,
            ),
            body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (120 / 80),
            children: List.generate( state.genres.length,(index){
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: blueDark,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(state.genres[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),
                ),
              );
            }),
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