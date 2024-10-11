
import 'package:flutter/material.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
    backgroundColor: AppColors.background,
    
    
      currentIndex: currentIndex,
      onTap: onTap,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: AppColors.primary,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center,color: AppColors.primary,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: AppColors.primary,),
          label: '',
        ),
      ],
    );
  }
}
