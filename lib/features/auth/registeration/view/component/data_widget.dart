import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/utilis/vlidation.dart';
import 'package:flutter_application_1/features/auth/registeration/controller/cubit/registration_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Data_widget extends StatelessWidget {
  Data_widget({super.key, required this.controller});
  // TextEditingController nameController = TextEditingController();
   final RegistrationCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
         RegistrationCubit controller=context.read<RegistrationCubit>();

          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // Image.network(
                    //   "https://th.bing.com/th/id/R.626588307129b58ccc8316f2b5393c0b?rik=79Y0AWZPuRerug&pid=ImgRaw&r=0",
                    //   height: 90,
                    //   width: 90,
                    // ),
                    Image.asset('assets/images/plantapp.png',
                     height : 90,
                      width: 90),
                    
                    Text(
                      "Sign up here",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 60),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.firstNameController,
                  keyboardType: TextInputType.name,
                  validator: Rgisteration_validation().name_validate,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(RegExp('r[A-Za-z]'))
                  // ],
                  decoration: InputDecoration(
                      label: Text("First Name"),
                      hintText: "Enter your first name",
                      prefix: Icon(Icons.abc),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(30))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.lastNameController,
                    keyboardType: TextInputType.name,
                    validator: Rgisteration_validation().name_validate,
                    decoration: decoration.copyWith(
                      labelText: "Last Name",
                    )),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.mailController,
                    keyboardType: TextInputType.name,
                    validator: Rgisteration_validation_email().email_validate,
                    decoration: decoration.copyWith(
                      labelText: "Mail",
                      hintText: "xxxxx @gmail.com",
                      prefixIcon: Icon(Icons.mail),
                    )),
                SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.name,
                  validator: Rgisteration_validation_password().password_validate,
                  decoration: decoration.copyWith(
                    labelText: "Password",
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  InputDecoration decoration = InputDecoration(
    hintText: "Enter your last name",
    prefix: Icon(Icons.abc),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(30)),
    focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(10)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
  );
}
