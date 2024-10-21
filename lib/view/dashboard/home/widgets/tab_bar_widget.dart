import 'package:flutter/material.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view/dashboard/home/widgets/tb_component.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.primary,
      tabs: const [
        TabrComponent(
          label: 'Cardio',
          imageAsset: 'lib/assets/images/cardio2.png',
        ),
        TabrComponent(
          label: 'Gym',
          imageAsset: 'lib/assets/images/dumbbell.png',
        ),
        TabrComponent(
          label: 'Boxing',
          imageAsset: 'lib/assets/images/boxing.png',
        ),
      ],
    );
  }
}
