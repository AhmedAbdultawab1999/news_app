// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_news.dart';
import 'package:news_app/modules/science_news.dart';
import 'package:news_app/modules/search_news.dart';
import 'package:news_app/modules/webview_page.dart';
import 'package:news_app/modules/sports_news.dart';

import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({Key? key}) : super(key: key);
  var titles = ['Business News', 'Sports News'];
  var pages = [BusinessNews(), SportsNews(), ScienceNews()];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(titles[0],style:TextStyle(
              //color: Colors.deepOrangeAccent
              ) ,),
            actions: [
              IconButton(
                  // Within the `FirstRoute` widget
                  onPressed: () {
                    navigateTo(context,SearchNews());
                  },
                  icon: Icon(Icons.search,
                   //color: Colors.orange, size: 40
                   )),
                  IconButton(
                  onPressed: () {
                    //navigateTo(context,SearchNews());
                    cubit.changecurrenttheme();
                  },
                  icon: Icon(Icons.brightness_4_rounded, 
                  //color: Colors.orange, size: 40
                  )),
            ],
          ),
          // ignore: prefer_const_literals_to_create_immutables
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_sharp), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science_rounded), label: 'Science'),
              /* BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'), */
            ],
            //backgroundColor: Colors.blue,
            //unselectedIconTheme: IconThemeData.fallback(),
            //unselectedItemColor: Colors.blueGrey,
            currentIndex: cubit.currentIndex,
            //selectedItemColor: Colors.amber,
            //fixedColor: Colors.blueGrey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (value) {
              cubit.changecurrentindex(value);
              print(cubit.currentIndex);
            },
          ),
          body: pages[cubit.currentIndex],
        );
      },
    );
  }
}
