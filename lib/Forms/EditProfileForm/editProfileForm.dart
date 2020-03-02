import 'package:flutter/material.dart';

import '../../main.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  int count = 0;
  TextEditingController fNameController = new TextEditingController();
  TextEditingController lNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  void initState() {
    setState(() {
      fNameController.text = "Paul";
      lNameController.text = "Brian";
      emailController.text = "paulbrian@gmail.com";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextField(
                      controller: fNameController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Oswald',
                      ),
                      decoration: InputDecoration(
                        hintText: "First name *",
                        hintStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 15,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w300),
                        //labelStyle: TextStyle(color: Colors.white70),
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 2.5, 20.0, 2.5),
                        border: InputBorder.none,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextField(
                      controller: lNameController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Oswald',
                      ),
                      decoration: InputDecoration(
                        hintText: "Last name *",
                        hintStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 15,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w300),
                        //labelStyle: TextStyle(color: Colors.white70),
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 2.5, 20.0, 2.5),
                        border: InputBorder.none,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'Oswald',
                      ),
                      decoration: InputDecoration(
                        hintText: "Email *",
                        hintStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 15,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w300),
                        //labelStyle: TextStyle(color: Colors.white70),
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 2.5, 20.0, 2.5),
                        border: InputBorder.none,
                      ),
                    )),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(bottom: 10, top: 0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     //mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //           width: MediaQuery.of(context).size.width,
          //           padding: EdgeInsets.all(10),
          //           margin: EdgeInsets.only(left: 20, right: 20, top: 5),
          //           decoration: BoxDecoration(
          //               color: Colors.white.withOpacity(0.7),
          //               border: Border.all(color: Colors.grey, width: 0.5),
          //               borderRadius: BorderRadius.all(Radius.circular(15))),
          //           child: Row(
          //             children: <Widget>[
          //               Flexible(
          //                 child: TextField(
          //                   //controller: phoneController,
          //                   keyboardType: TextInputType.text,
          //                   obscureText: count % 2 != 0 ? false : true,
          //                   style: TextStyle(
          //                     color: Colors.black87,
          //                     fontFamily: 'Oswald',
          //                   ),
          //                   decoration: InputDecoration(
          //                     hintText: "Password *",
          //                     hintStyle: TextStyle(
          //                         color: Colors.black38,
          //                         fontSize: 15,
          //                         fontFamily: 'Oswald',
          //                         fontWeight: FontWeight.w300),
          //                     //labelStyle: TextStyle(color: Colors.white70),
          //                     contentPadding:
          //                         EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
          //                     border: InputBorder.none,
          //                   ),
          //                 ),
          //               ),
          //               GestureDetector(
          //                 onTap: () {
          //                   setState(() {
          //                     count++;
          //                   });
          //                 },
          //                 child: Container(
          //                     padding: EdgeInsets.all(4),
          //                     child: Icon(
          //                       count % 2 != 0
          //                           ? Icons.visibility
          //                           : Icons.visibility_off,
          //                       size: 22,
          //                       color: count % 2 != 0 ? header : Colors.black38,
          //                     )),
          //               )
          //             ],
          //           )),
          //     ],
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(bottom: 10, top: 0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     //mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //           width: MediaQuery.of(context).size.width,
          //           padding: EdgeInsets.all(10),
          //           margin: EdgeInsets.only(left: 20, right: 20, top: 5),
          //           decoration: BoxDecoration(
          //               color: Colors.white.withOpacity(0.7),
          //               border: Border.all(color: Colors.grey, width: 0.5),
          //               borderRadius: BorderRadius.all(Radius.circular(15))),
          //           child: TextField(
          //             //controller: phoneController,
          //             keyboardType: TextInputType.text,
          //             obscureText: true,
          //             style: TextStyle(
          //               color: Colors.black87,
          //               fontFamily: 'Oswald',
          //             ),
          //             decoration: InputDecoration(
          //               hintText: "Confirm Password *",
          //               hintStyle: TextStyle(
          //                   color: Colors.black38,
          //                   fontSize: 15,
          //                   fontFamily: 'Oswald',
          //                   fontWeight: FontWeight.w300),
          //               //labelStyle: TextStyle(color: Colors.white70),
          //               contentPadding:
          //                   EdgeInsets.fromLTRB(10.0, 2.5, 20.0, 2.5),
          //               border: InputBorder.none,
          //             ),
          //           )),
          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(bottom: 20, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginPage()),
                    // );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: header,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'BebasNeue',
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
