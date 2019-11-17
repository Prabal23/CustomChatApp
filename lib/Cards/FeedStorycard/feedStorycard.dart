import 'package:flutter/material.dart';

class FeedStorycard extends StatefulWidget {
  final index;
  FeedStorycard(this.index);
  @override
  _FeedStorycardState createState() => _FeedStorycardState();
}

class _FeedStorycardState extends State<FeedStorycard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => HotelSearchPage()),
          // );
        },
        child: new Container(
          margin: EdgeInsets.only(left: 15, right: 5, top: 5, bottom: 5),
          padding: EdgeInsets.only(left: 0),
          height: 100,
          width: 90,
          decoration: BoxDecoration(
            ////// <<<<< Picture start >>>>> //////
            image: DecorationImage(
              image: widget.index == 0
                  ? AssetImage("assets/images/man.png")
                  : widget.index == 1
                      ? AssetImage("assets/images/man2.jpg")
                      : widget.index == 2
                          ? AssetImage("assets/images/man.png")
                          : widget.index == 3
                              ? AssetImage("assets/images/man2.jpg")
                              : widget.index == 4
                                  ? AssetImage("assets/images/man.png")
                                  : AssetImage("assets/images/man2.jpg"),
              fit: BoxFit.cover,
            ),
            ////// <<<<< Picture end >>>>> //////
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Colors.black.withOpacity(.5),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 0),
                  padding: EdgeInsets.only(left: 0),
                  height: 110,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  )),
              widget.index == 0
                  ////// <<<<< Story add start >>>>> //////
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 26,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 0, left: 10, bottom: 5),
                            child: Text(
                              "Add to story",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                    )
                  ////// <<<<< Story add end >>>>> //////
                  :
                  ////// <<<<< Name start >>>>> //////
                  Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: 10, left: 10, bottom: 5),
                      child: Text(
                        widget.index == 1
                            ? "John Smith"
                            : widget.index == 2
                                ? "David Ryan"
                                : widget.index == 3
                                    ? "Simon Wright"
                                    : widget.index == 4
                                        ? "Mike Johnson"
                                        : "Daniel Smith",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w300),
                      )),
              ////// <<<<< Name end >>>>> //////
            ],
          ),
        ),
      ),
    );
  }
}
