import 'package:flutter/material.dart';
import '../../themes/themes.dart';
import '../widgets/app_containers.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String getTime() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Morning,';
      }
      if (hour < 17) {
        return 'Afternoon,';
      }
      return 'Evening,';
    }

    String getUser() {
      return 'Fred';
    }

    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Good ',
                style: AppTextStyle.medium25,
              ),
              TextSpan(
                text: getTime(),
                style: AppTextStyle.regular25,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          getUser(),
          style: AppTextStyle.bold25.copyWith(
            color: AppColors.transparent,
            shadows: [
              const Shadow(
                offset: Offset(0, -5),
                color: AppColors.darkGreen,
              ),
            ],
            decoration: TextDecoration.underline,
            decorationThickness: 7,
            decorationColor: AppColors.yellow,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const GreetingWidget(),
        const SizedBox(height: 20),
        const SizedBox(height: 10),
        AppHorizontalContainer(
          contentName: 'Training',
          title: 'Unit',
          description: 'Learn new vocabulary pronunciation',
          image: Image.network(
            'https://cdn-icons-png.flaticon.com/512/2232/2232688.png',
          ),
          progressValue: '10',
          progressTitle: 'Finished',
          scoreValue: '136',
          scoreTitle: 'Total point',
          mainColor: AppColors.lightGreen,
          leadingColor: AppColors.darkGreen,
          leadingTitleColor: AppColors.white,
        ),
        const SizedBox(height: 20),
        AppHorizontalContainer(
          contentName: 'Training',
          title: 'Test',
          description: 'Our test simulator will help you!',
          image: Image.network(
            'https://cdn-icons-png.flaticon.com/128/3068/3068553.png',
          ),
          progressValue: '3',
          progressTitle: 'Finished',
          scoreValue: '254',
          scoreTitle: 'Total point',
          mainColor: AppColors.lightRed,
          leadingColor: AppColors.red,
        ),
      ],
    );
  }
}