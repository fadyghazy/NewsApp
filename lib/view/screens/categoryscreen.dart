import 'package:flutter/material.dart';
import 'package:news2/control/providers/newcategoriesprovider.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../control/providers/newcategoriesprovider.dart';
import '../../widgets/cardNews.dart';
class CategoryScreen extends StatefulWidget {
  String Category;
  CategoryScreen(this.Category);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black ,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("${widget.Category}",textAlign:TextAlign.start,style: TextStyle(fontSize:fontBigger,color:textColor,)
                ),
              ),
            ),

            Expanded(
                child:
                FutureBuilder(
                  future: APIClass.fetchNewsCategories("${widget.Category.toLowerCase().toString()}"), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    return(snapshot.data==null)?Text(""):ListView.builder(
    itemCount:snapshot.data.length,
    itemBuilder: (BuildContext context, int index) {
    return CardNews(NetworkImageCard:'${snapshot.data[index].urlToImage}', textCardCategories:"${snapshot.data[index].title}", LinkNews:"${snapshot.data[index].url}");
    },
    );
    },


                    )


                  )


          ],
        )
    );

  }
}