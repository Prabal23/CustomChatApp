import 'package:chatapp_new/MainScreens/GroupDetailsPage/groupDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GroupCard extends StatefulWidget {
  final index;
  final loading;
  GroupCard(this.index, this.loading);

  @override
  _GroupCardState createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GroupDetailsPage()));
        },
        child: widget.loading == false
            ? Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                  //border: Border.all(width: 0.8, color: Colors.grey[300]),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                      color: Colors.black38,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                      padding: EdgeInsets.only(right: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ////// <<<<< Pic start >>>>> //////
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            padding: EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              radius: 27.0,
                              backgroundColor: Colors.white,
                              backgroundImage: widget.index == 0
                                  ? AssetImage('assets/images/f4.jpg')
                                  : widget.index == 1
                                      ? AssetImage('assets/images/f.jpg')
                                      : widget.index == 2
                                          ? AssetImage('assets/images/f6.jpg')
                                          : widget.index == 3
                                              ? AssetImage(
                                                  'assets/images/f5.jpg')
                                              : AssetImage(
                                                  'assets/images/f2.jpg'),
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                          ),
                          ////// <<<<< Pic end >>>>> //////
                          
                          ////// <<<<< Name start >>>>> //////
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              widget.index == 0
                                  ? "Flutter Rajjo"
                                  : widget.index == 1
                                      ? "Flutter & Dart"
                                      : widget.index == 2
                                          ? "Friends"
                                          : widget.index == 3
                                              ? "School Friends"
                                              : "Colleagues",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          ////// <<<<< Name end >>>>> //////
                          
                          ////// <<<<< Member start >>>>> //////
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            child: Text(
                              widget.index == 0
                                  ? "6 members"
                                  : widget.index == 1
                                      ? "16 members"
                                      : widget.index == 2
                                          ? "26 members"
                                          : widget.index == 3
                                              ? "32 members"
                                              : "34 members",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Colors.white54),
                            ),
                          ),
                          ////// <<<<< Member end >>>>> //////
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
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
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                child: Column(
                  children: <Widget>[
                    Container(
                      //color: Colors.red,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                      padding: EdgeInsets.only(right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                            padding: EdgeInsets.all(1.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[700],
                              highlightColor: Colors.grey[500],
                              child: CircleAvatar(
                                radius: 27.0,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[700],
                                  highlightColor: Colors.grey[500],
                                  child: Container(
                                    width: 80,
                                    height: 22,
                                    child: Container(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[700],
                                    highlightColor: Colors.grey[500],
                                    child: Container(
                                      width: 50,
                                      height: 12,
                                      child: Container(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
