import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBody extends StatelessWidget {
  OnBoardingBody({super.key, required this.controller});
  OnboardingControllerCubit controller;
  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            
            Text("welcome in our app"),
            Expanded(
              child: BlocProvider<OnboardingControllerCubit>.value(
                value: controller,
                child: BlocBuilder<OnboardingControllerCubit,
                    OnboardingControllerState>(
                  builder: (context, state) {
                    OnboardingControllerCubit controller =
                        context.read<OnboardingControllerCubit>();
                    return PageView(
                    controller: controller.pageController,
                      children:
                          List.generate(controller.data.length, (index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset(controller.data[index].image,height:controller.data[index].heights),
                          Text(controller.data[index].title,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                          
                            Text(controller.data[index].subtitle,
                          style: TextStyle(fontSize: 15,color: Colors.grey ),
                          ),
                          ],
                          
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ],
        );
  }
}