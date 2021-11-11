import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyrics_app/presentation/lyric/create_lyric.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/navigator.dart';

class LyricsList extends StatelessWidget {
  const LyricsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return LyricsListUI();
  }
  
}

class LyricsListUI extends StatefulWidget {
  const LyricsListUI({ Key? key }) : super(key: key);


  @override
  _LyricsListUIState createState() => _LyricsListUIState();
}

class _LyricsListUIState extends State<LyricsListUI> {

  



  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D','d','d','d','d','d'
    ];

    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueDark,
        foregroundColor: Colors.white,
        onPressed: () {
          navigateToPage(context,CreateLyric());
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leadingWidth: 40,
        centerTitle: true,
        title: Text(
          "Letras",
          style: titleStyle
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              splashRadius: 25,
              onPressed: (){},
               icon: Container(
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  'assets/save.svg',
                  color: green
                ),
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
                    autofocus: false,
                    
                    cursorColor: Theme.of(context).primaryColor,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Buscar Canción',
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.search,color: Theme.of(context).primaryColor),
                        onPressed: (){},
                      ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 13
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: size.height,
                child:  ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 7,
                    right: 7,
                    top: 7,
                    bottom: kBottomNavigationBarHeight * 5
                  ),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool slidableOpened = false;
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.18,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Container(
                          child: Center(
                            child: Builder(
                              builder: (newContext) {
                                return ListTile(
                                  onTap: (){
                                    print('Abirendo Cancion');
                                  },
                                  leading: Container(
                                    decoration: BoxDecoration(
                                      color: blueDark,
                                      borderRadius:BorderRadiusDirectional.all(Radius.circular(10.0)),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 15 ,horizontal: 15),
                                    child: SvgPicture.asset(
                                      'assets/music-note-solid.svg',
                                      color: Colors.white
                                    )
                                  ),
                                  title: Text(
                                    'Hola',
                                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
                                  ),
                                  subtitle: Text('Norteña'),
                                  trailing: Container(
                                    padding: EdgeInsetsDirectional.all(5),
                                    width: 40,
                                    height: 40,
                                    child: GestureDetector(
                                      onTap: () {
                                        if(slidableOpened){
                                          Slidable.of(newContext)?.close();
                                          slidableOpened = false;
                                        }else{
                                          Slidable.of(newContext)?.open(
                                            actionType: SlideActionType.secondary,
                                          ); 
                                          slidableOpened = true;
                                        }
                                      },
                                      child: SvgPicture.asset(
                                        'assets/dots.svg',
                                        color: Color(0xffDBDCDF)
                                      ),
                                    ),
                                  ),
                                  
                                );
                              }
                            ),
                          ),
                        ),
                      ),
                      secondaryActions: <Widget>[
                        _buildIcon(
                          color: Color(0xffFF4D4D),
                          icon: 'trash',
                          onPressed: (){}
                        ),
                        _buildIcon(
                          color: Colors.orange.shade400,
                          icon: 'pencil',
                          onPressed: (){}
                        ),
                        _buildIcon(
                          color: green,
                          icon: 'save',
                          onPressed: (){}
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(
                    height: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildIcon({
    required String icon,
    required VoidCallback onPressed ,
     required Color color
  }){
    return IconSlideAction(
      color: Colors.transparent,
       iconWidget: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: SvgPicture.asset(
              'assets/$icon.svg',
              color: Colors.white
            ),
          ),
        ),
                                
      ),
      onTap: onPressed,
    );

  }
}
