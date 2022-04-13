// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/modules/search_news.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AppCubit()..geBusinessNews()..geSportstNews()..geSciencetNews()..getSearchNews('egypt'),),
    ],
     child: BlocConsumer<AppCubit,AppStates>(
       builder: (context, state) {
         AppCubit cubit=AppCubit.get(context);
         return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          color: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      darkTheme:ThemeData(
        scaffoldBackgroundColor: HexColor('333739'),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
          ),
          color: HexColor('333739'),
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 25,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: HexColor('333739'),
          selectedIconTheme: IconThemeData(
            color: Colors.deepOrange,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.orange,
          )
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      themeMode:cubit.isdark ? ThemeMode.dark:ThemeMode.light,
      home: NewsLayout(),
    );
     
     },
      listener: (context,state){},
      )
      );
    
    }
}

 /* AppCubit()
          ..geBusinessNews()
          ..geSportstNews()
          ..geSciencetNews()
          ..getSearchNews('eg') */