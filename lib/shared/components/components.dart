// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webview_page.dart';

Widget buildNewsItems(Map article,context) {
  if(article['urlToImage']==null){
    article['urlToImage']='https://www.freeiconspng.com/uploads/news-icon-18.png';
  }
  return InkWell(
    onTap: (() {
      navigateTo(context, WebviewPage(article['url']));
    }),
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
                  width: 150,
                  margin: EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: NetworkImage(
                          '${article['urlToImage']}'),
                    ),
                  ),
                ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 20,top: 10,bottom: 10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            
              children: [
                Text('${article["title"]}',style: Theme.of(context).textTheme.bodyText1,maxLines: 3,overflow: TextOverflow.ellipsis,),
                 Text('${article["publishedAt"]}',style: TextStyle(fontSize: 16,color: Colors.grey,overflow: TextOverflow.ellipsis))
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildArticelItems(List<dynamic> article){
  if(article.isNotEmpty){
        return ListView.separated(
      itemCount: article.length,
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 1,width: double.infinity,color: Colors.grey,),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return buildNewsItems(article[index],context);
      },
    );
    
     
      }
      else{
        return Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        );
      }
}
Widget buildSearchItem(TextEditingController serchController,Function myfunction)=>Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller:serchController ,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search,color: Colors.black),
               border: OutlineInputBorder(),
               contentPadding: EdgeInsets.all(20),
               label:Text('search',style: TextStyle(color: Colors.blue)),
               icon: Icon(Icons.search),
               //prefixIcon: 
              ),
              keyboardType: TextInputType.text,
              maxLines: 1,
              onChanged: (value){
                myfunction(value);
              },
            ),
          );

void navigateTo(BuildContext context,Widget widget){
  Navigator.push(context,MaterialPageRoute(builder: (context) => widget),);
}
        