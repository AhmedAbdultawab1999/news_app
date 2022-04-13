import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class ScienceNews extends StatelessWidget {
  const ScienceNews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context, state) => AppCubit(),
     builder: (context , state){
       AppCubit cubit=AppCubit.get(context);
      return buildArticelItems(cubit.sience_news);
        },
     
     );
  
  
  }
}