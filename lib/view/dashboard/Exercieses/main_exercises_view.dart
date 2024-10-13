import 'package:flutter/material.dart';
import 'package:gym_mate/res/assets/image_assets.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class MainExercisesView extends StatelessWidget {
  const MainExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
 leading: const Icon(Icons.menu,color: Colors.white,size: 30,),
        backgroundColor: AppColors.background,
 title: const Text(
          "Exercises",
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
        ),
 
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
          Container(
            height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border:Border.all(color: AppColors.primary.withOpacity(.5)),
                  image: DecorationImage(
                    image: const AssetImage(ImageAssets.yoga), // Path to your image
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.3),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
                child:  Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,bottom: 10),
                    child: Row(
                      children: [
                     
                        //container
                        Container(),


                      
                        
                      ],
                    )
                  ),
                ),
              ),  
          
          
          ],
        ),
      ),
    );
  }
}