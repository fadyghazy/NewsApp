import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../control/providers/newsprovider.dart';
import '../../widgets/buttoncategories.dart';
import '../../widgets/cardNews.dart';
class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:black ,
      body:Consumer<NewsProvider>(
          builder:(context, value, child)=>Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Choose News Categories",style: TextStyle(fontSize:fontBigger,color:textColor)
                    ),
                  ),
                ),
                Container(
                 color: black,
                  height: MediaQuery.of(context).size.height/14,
                  child: ListView(

                    scrollDirection: Axis.horizontal,
                    children: [
                      ButtonCategories(ColorButton: blue, textCategories: "General"),
                      ButtonCategories(ColorButton: red, textCategories: "Sports"),
                      ButtonCategories(ColorButton: orangeLight, textCategories: "Entertainment"),
                      ButtonCategories(ColorButton: orangeDark, textCategories:"Business"),
                      ButtonCategories(ColorButton: green, textCategories: "Science"),
                      ButtonCategories(ColorButton: orangeLight, textCategories: "Technology"),
                      ButtonCategories(ColorButton: orangeDark, textCategories: "Health"),

                    ],
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Best News Categories",style: TextStyle(fontSize:fontTitle,color:textColor),textAlign: TextAlign.start,

                    ),
                  ),
                ),
                Expanded(
                    child:
                    Consumer<NewsProvider>(
                        builder:(context, value, child) {
                          return
                            ListView.builder(
                              itemCount: value.listDataModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CardNews(
                                  NetworkImageCard: '${value.listDataModel[index].urlToImage}',
                                  textCardCategories: "${value.listDataModel[index].title}",
                                  LinkNews: "${value.listDataModel[index].url}");
                              },

                            );
                        }





                    )

                )
              ]
          )

      ),

    );




  }
}