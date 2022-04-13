// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/science_news.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:dio/dio.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(BuildContext context)=>BlocProvider.of(context);
  int currentIndex=0;
  void changecurrentindex(int index){
    currentIndex=index;
    emit(AppChangBottomNavigationBar());
    /* if(currentIndex==1){
      geSportstNews();
      emit(AppGetSportssNews());
    }
    else if(currentIndex==2){
      geSciencetNews();
      emit(AppGetScienceNews());
    } */
  }
  //late Map<String,dynamic> business_news;
  late List<dynamic> business_news;
void geBusinessNews() async{

  try {
    business_news=[];
    var response = await Dio().get('https://newsapi.org/v2/top-headlines?country=eg&apiKey=ae14e589c99b4e9e92b50a00e9c4c778&category=business').then((value){
      emit(AppGetBusinessNews());
      //print(value.data);
      business_news=value.data['articles'];
      //print(business_news);
    });
    //print(response);
  } catch (e) {
    print(e);
  }
}
late List<dynamic> Searched_news;
void getSearchNews(String query) async{

  try {
    Searched_news=[];
    var response = await Dio().get('https://newsapi.org/v2/everything?apiKey=ae14e589c99b4e9e92b50a00e9c4c778&q=$query').then((value){
      emit(AppGetSearchedNews());
      //print(value.data);
      Searched_news=value.data['articles'];
      //print(business_news);
    });
    //print(response);
  } catch (e) {
    print(e);
  }
}


late List<dynamic> sports_news;
void geSportstNews() async {
   try {
    sports_news=[];
    var response = await Dio().get('https://newsapi.org/v2/top-headlines?country=eg&apiKey=ae14e589c99b4e9e92b50a00e9c4c778&category=sports').then((value){
      emit(AppGetSportssNews());
      //print(value.data);

      sports_news=value.data['articles'];
    });
    //print(response);
  } catch (e) {
    print(e);
  }
}
late List<dynamic> sience_news;
void geSciencetNews() async {
  sience_news=[];
  try {
    var response = await Dio().get('https://newsapi.org/v2/top-headlines?country=eg&apiKey=ae14e589c99b4e9e92b50a00e9c4c778&category=science').then((value){
      emit(AppGetScienceNews());
      //print(value.data);
      sience_news=value.data['articles'];

    });
    print(response);
  } catch (e) {
    print(e);
  }
}

bool isdark=false;
void changecurrenttheme(){
  isdark=!isdark;
  emit(AppChangeTheme());
}
}