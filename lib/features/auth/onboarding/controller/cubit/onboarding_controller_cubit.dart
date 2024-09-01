import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/onboarding/model/onboarding_model.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/data_widget.dart';
import 'package:flutter_application_1/features/auth/registeration/view/page/registeration.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());
  PageController pageController = PageController();
  void onChangeToNext() {
    pageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

    
   Future <void> onCallSkip(BuildContext context)async {
      SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
  await  sharedPrefrences.setBool('onboarding',true);
    Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => Rgister()));
  }

  List data = [
    OnboardingModel(
        image: 'assets/images/photo_2024-04-16_03-10-34.jpg',
        title: 'E Shopping',
        subtitle: 'Exploretop organic and diffrent pants',
        heights: 200),
    OnboardingModel(
        image: 'assets/images/photo_2024-04-16_02-34-27.jpg',
        title: 'Delivery on the way',
        subtitle: 'Get your order by speed delivery',
        heights: 200),
    OnboardingModel(
        image: 'assets/images/photo_2024-04-16_02-34-35.jpg',
        title: 'Delivery Arrived',
        subtitle: 'Order is arrived at your place',
        heights: 200),
  ];
}
