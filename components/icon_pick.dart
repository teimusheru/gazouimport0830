

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_alarm_clock/NFT1/NFTgamen_1_/Profile/components/profile_pic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../bottom_bar.dart';
import '../profile_score.dart';





class ProfilePic1 extends StatelessWidget {

  String imagePath = "";
  final picker =ImagePicker();







  @override

  Widget build(BuildContext context) {

    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 80.0,
            // backgroundImage: _imageFile==null? AssetImage("assets/images/Profile.png"),
          ),

          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () async {
                  var result = await showModalBottomSheet<int>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Choose Profile photo",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                              FlatButton.icon(
                                icon: Icon(Icons.camera),
                          onPressed: () {
                            pickMedia;
                          },
                                label: Text("Camera"),
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.image),
                                onPressed: () {
                                  pickMedia;
                                },
                                label: Text("Gallery"),
                              ),
                            ])
                          ],
                        ),
                      );
                    },
                  );
                  print('bottom sheet result: $result');
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  void pickMedia({required ImageSource source}) async {
   final file = await ImagePicker().pickImage(source: ImageSource.gallery);
   setState(() {});
  }

  void setState(Null Function() param0) {}
/*
  Future pickImage(ImageSource camera) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      File? img = File(image.path);

      setState(() {
        _image = img;
        Navigator.of(context).pop();


      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC(ImageSource gallery) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
*/
}

