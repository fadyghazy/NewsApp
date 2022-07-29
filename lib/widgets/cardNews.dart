import 'package:flutter/material.dart';
import '../constant.dart';
import '../control/functions/functions.dart';
class CardNews extends StatelessWidget {
  String  NetworkImageCard;
  String textCardCategories;
  String LinkNews;
  CardNews({required this.NetworkImageCard,required this.textCardCategories,required this.LinkNews});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Fun.openLink(LinkNews);
      },
      child: Card(
        elevation: 5,
        shadowColor: black,
        color:Colors.greenAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        child:Column(
          children: [
            Container(
              height:200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight: Radius.circular(25)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (NetworkImageCard=="null")?NetworkImage("https://bitsofco.de/content/images/2018/12/broken-1.png"):NetworkImage("${NetworkImageCard}")
                  )
              ),
            ),
            Container(
              width:MediaQuery.of(context).size.width*0.90,
              alignment: Alignment.center,
              child: Text("$textCardCategories",style:TextStyle(color:textColor),textAlign: TextAlign.center,),
            ),
            Container(

                child:Row(
                  children: [
                    IconButton(onPressed: (){
                      Fun.shareLink(LinkNews);
                    }, icon:Icon(Icons.share)),
                    IconButton(onPressed: (){
                      Fun.copyLink(LinkNews);
                    }, icon:Icon(Icons.copy_rounded)),
                  ],
                )
            )
          ],
        ) ,
      ),
    );
  }
}