// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class SearchNews extends StatelessWidget {
   SearchNews({ Key? key }) : super(key: key);
  late var serchController=TextEditingController();
  //String query='eg';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context, state) => AppCubit(),
     builder: (context , state){
       AppCubit cubit=AppCubit.get(context);
      return Scaffold(
        appBar:AppBar(),
        body: Column(
        children: [
          //buildSearchItem(serchController,cubit.geSearchNews()),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller:serchController ,
              decoration: InputDecoration(
               border: OutlineInputBorder(),
               contentPadding: EdgeInsets.all(20),
               //prefixIcon: Icon(Icons.search,color: Colors.blue,),
               suffixIcon:Icon(Icons.search,),
               label: Text('search'),
              ),
              keyboardType: TextInputType.text,
              maxLines: 1,
              onChanged: (value){
                //query=value;
               cubit.getSearchNews(value);
              },
            ),
          ),
          Expanded(child: buildArticelItems(cubit.Searched_news))
        ],
      )
      ,
      );
      },
     
     );
    }
}