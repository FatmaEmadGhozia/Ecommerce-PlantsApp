import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utilis/context_extension.dart';
import 'package:flutter_application_1/features/auth/verification/controller/cubit/verification_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class verificationpage extends StatelessWidget {
  const verificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
        final VerificationCubit cubit=context.read<VerificationCubit>();
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("enter your code"),
                Text(context.width.toString()),
                 PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 5,
                    obscureText: true,
                    obscuringCharacter: '*',
                    // obscuringWidget: const FlutterLogo(
                    //   size: 24,
                    // ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: context.width/6,
                      fieldWidth: context.width/6,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.green,
                      inactiveColor: Colors.black,
                      activeColor: Colors.black,
                      selectedColor: Colors.black,
                      selectedFillColor: Colors.yellow,
                      fieldOuterPadding: EdgeInsets.only(right: MediaQuery.of(context).size.width/30),
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: cubit.pinCodeController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      
                    },
                    
                  ),
                IconButton(onPressed: cubit.onTapConfirm, icon: Icon(Icons.done))

                ]
                
                ),
          );
        },
      ), 
    );
  }
}
