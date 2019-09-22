import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import '../main.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  int _current = 0;
  int _isBack = 0;
  String result = '';
  bool _isChecked = false;
  List<String> user = [];
  var users;
  SharedPreferences sharedPreferences;
  String theme = "";
  Timer _timer;
  int _start = 3;
  bool loading = true;
  TextEditingController src = new TextEditingController();
  List<String> name = [
    "John Smith",
    "David Ryan",
    "Simon Wright",
    "Mike Johnson",
    "Daniel Smith"
  ];
  var friendname = List<String>();

  @override
  void initState() {
    print(user.length);
    sharedPrefcheck();
    timerCheck();
    friendname.addAll(name);
    super.initState();
  }

  void sharedPrefcheck() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      theme = sharedPreferences.getString("theme");
    });
    //print(theme);
  }

  void timerCheck() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            setState(() {
              loading = false;
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(name);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        friendname.clear();
        friendname.addAll(dummyListData);
        //print(friendname);
      });
      return;
    } else {
      setState(() {
        friendname.clear();
        friendname.addAll(name);
        //print(friendname);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black.withOpacity(0.5),
          titleSpacing: 0.0,
          title: Container(
            margin: EdgeInsets.only(top: 0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 5), child: BackButton()),
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 0, right: 20, top: 0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              onChanged: (value) {
                                filterSearchResults(value);
                              },
                              controller: src,
                              autofocus: true,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Oswald',
                              ),
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w300),
                                //labelStyle: TextStyle(color: Colors.white70),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 0, 20.0, 0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          actions: <Widget>[],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: theme == "1" || theme == null
                      ? AssetImage("assets/images/f4.jpg")
                      : theme == "2"
                          ? AssetImage("assets/images/f.jpg")
                          : theme == "3"
                              ? AssetImage("assets/images/f6.jpg")
                              : theme == "4"
                                  ? AssetImage("assets/images/f5.jpg")
                                  : theme == "5"
                                      ? AssetImage("assets/images/friend8.jpg")
                                      : theme == "6"
                                          ? AssetImage("assets/images/f2.jpg")
                                          : theme == "7"
                                              ? AssetImage(
                                                  "assets/images/f9.jpg")
                                              : theme == "8"
                                                  ? AssetImage(
                                                      "assets/images/f10.png")
                                                  : AssetImage(
                                                      "assets/images/white.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
              child: null,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            "Recent searches",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.normal),
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            margin:
                                EdgeInsets.only(top: 10, left: 20, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Colors.white,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(
                                    width: 0.5, color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  )),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 15, top: 5),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                            //border: Border.all(width: 0.8, color: Colors.grey[300]),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: Colors.black38,
                                //offset: Offset(6.0, 7.0),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(
                              top: 2.5, bottom: 2.5, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  //color: Colors.red,
                                  margin: EdgeInsets.only(
                                      left: 15, right: 20, top: 0),
                                  padding: EdgeInsets.only(right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                            padding: EdgeInsets.all(1.0),
                                            child: CircleAvatar(
                                              radius: 12.0,
                                              backgroundColor: Colors.white,
                                              backgroundImage: index == 0
                                                  ? AssetImage(
                                                      'assets/images/man.png')
                                                  : index == 1
                                                      ? AssetImage(
                                                          'assets/images/man2.jpg')
                                                      : index == 2
                                                          ? AssetImage(
                                                              'assets/images/man.png')
                                                          : index == 3
                                                              ? AssetImage(
                                                                  'assets/images/man2.jpg')
                                                              : AssetImage(
                                                                  'assets/images/man.png'),
                                            ),
                                            decoration: new BoxDecoration(
                                              color: Colors
                                                  .grey[300], // border color
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              friendname[index],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                   friendname.removeAt(index); 
                                  });
                                },
                                child: Container(
                                  child: Icon(Icons.close,
                                      color: back_new.withOpacity(0.5), size: 18),
                                ),
                              )
                            ],
                          ),
                        );
                      }, childCount: friendname.length),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
