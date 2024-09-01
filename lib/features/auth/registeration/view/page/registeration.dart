import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/registeration/controller/cubit/registration_cubit.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/bottom_widget.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/data_widget.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/loginPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Rgister extends StatelessWidget {
  const Rgister({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            return Scaffold(
              body: Data_widget(controller: context.read<RegistrationCubit>()),
              bottomNavigationBar:  SizedBox(
                child: BottomNavigationWidget(
                  controller: context.read<RegistrationCubit>(),
                ),
                height: 150,
              ),
            );
          },
        ),
      ),
    );
  }
}