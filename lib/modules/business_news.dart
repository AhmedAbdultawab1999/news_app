// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../shared/components/components.dart';

class BusinessNews extends StatelessWidget {
  const BusinessNews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context, state) => AppCubit()..geBusinessNews(),
     builder: (context , state){
       AppCubit cubit=AppCubit.get(context);
      return buildArticelItems(cubit.business_news);
      
      },
     
     );
    }
}