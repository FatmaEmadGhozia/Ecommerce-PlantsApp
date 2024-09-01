import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utilis/context_extension.dart';
import 'package:flutter_application_1/features/auth/registeration/controller/cubit/registration_cubit.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/confirm_password.dart';
import 'package:flutter_application_1/features/dashboard/modules/users/model/repo/local_db_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({Key? key, required this.controller}) : super(key: key);

  final RegistrationCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          RegistrationCubit controller = context.read<RegistrationCubit>();

          return Column(
            children: [
              SizedBox(
                height: context.height / 20,
              ),
              FilledButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 80, 161, 81)),
                ),
                onPressed: () async {
                  await (await DatabaseRepo.instance).insert(name: 'Ahmed', address: 'Tanta');
                  log('added successfully');
                  await controller.addUser();
                  // Navigate to the Confirm Password page
                  // Navigator.pushNamed(context, 'confirm_password');
                   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Confirm_pass ()),
            );
                },
                child: const Text("Confirm"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account? "),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color:Color.fromARGB(255, 80, 161, 81),
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 80, 161, 81),
                        decorationThickness: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
