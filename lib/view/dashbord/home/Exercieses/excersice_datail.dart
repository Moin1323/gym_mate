import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/assets/image_assets.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/components/custom_primary_button.dart';
import 'package:http/http.dart';

class ExcersiceDatail extends StatefulWidget {
  const ExcersiceDatail({super.key});

  @override
  State<ExcersiceDatail> createState() => _ExcersiceDatailState();
}

class _ExcersiceDatailState extends State<ExcersiceDatail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(backgroundColor: AppColors.background,

leading: const Icon(Icons.arrow_back,size: 30,color: Colors.white,),
title: const Text(
          "Dumbbell Bench Press",
          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Image.asset(ImageAssets.dumbell),
          const SizedBox(height: 20),
    
    //Text("Dumbbell Bench Press",style: TextStyle(fontSize: 25,color: Colors.white),),
    
        Expanded(
          child: ListView.builder(
            itemCount: 5
            ,itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              color: Colors.grey.withOpacity(.1),
              child: Container(
                
                padding: EdgeInsets.all(5),
                child: ListTile(
                leading:Image.asset(ImageAssets.dumbell1),
title: Text("Lie flat on a bench ",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),)
            ),
          );
          } ),
        ),
          const SizedBox(height: 20),

Center(
  child: CustomPrimaryButton(text: 'Done', onPressed: (){
    Get.back();
  }),
)          
        ],),
      ),
    );
  }
}