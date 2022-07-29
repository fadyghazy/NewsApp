import 'package:flutter/material.dart';
import '../constant.dart';
import '../view/screens/categoryscreen.dart';
class ButtonCategories extends StatelessWidget {

  Color ColorButton;
  String textCategories;

  ButtonCategories({required this.ColorButton, required this.textCategories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5,vertical:5),
      width: 200,
      color:black,
      child: RaisedButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
          return CategoryScreen(textCategories.toLowerCase().toString());
        }

        ));
      },child:Text("$textCategories",style: TextStyle(fontSize: fontSmaller,fontWeight: FontWeight.bold),
      ),color:ColorButton ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),

    );
  }
}