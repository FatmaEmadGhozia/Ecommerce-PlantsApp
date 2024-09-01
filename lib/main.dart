import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/my_theme.dart';
import 'package:flutter_application_1/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/confirm_password.dart';
import 'package:flutter_application_1/features/auth/registeration/view/page/registeration.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/loginPage.dart';
import 'package:flutter_application_1/features/auth/registeration/view/component/forget_password.dart';
import 'package:flutter_application_1/features/auth/verification/view/page/verification_page.dart';
import 'package:flutter_application_1/features/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_application_1/features/dashboard/modules/product/view/page/product_page.dart';
import 'package:flutter_application_1/features/dashboard/view/page/dashboard_page.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/dashboard/modules/new_product/view/page/new_product_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppInitializer());
}

class AppInitializer extends StatefulWidget {
  @override
  _AppInitializerState createState() => _AppInitializerState();
}
class _AppInitializerState extends State<AppInitializer> {
  bool _isInitialized = false;
  bool _onBoarding = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

    setState(() {
      _isInitialized = true;
      _onBoarding = onBoarding;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return MaterialApp(
        theme: Mytheme.instance.light,
        darkTheme:Mytheme.instance.light ,
        themeMode: ThemeMode.light,
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
          
        ),
      );
    }

    return DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        theme: Mytheme.instance.light,
        darkTheme:Mytheme.instance.dark ,
        themeMode: ThemeMode.dark,
        useInheritedMediaQuery: true,
        initialRoute: _onBoarding ? 'registration' : 'splash',
        onGenerateRoute: MyRoutes.onGenerateRoute,
      ),
    );
  }
}

class MyRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => loginPage(),
        );
      case 'registration':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => Rgister(),
        );
      case 'onboarding':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => OnBoardingPage(),
        );
      case 'splash':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => SplashScreen(),
        );
        case 'dashboard':
         return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => DashboardPage(),
        );
        case 'confirm_password':
         return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => Confirm_pass(),
        );
         case 'new_product':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => NewProductPage(), // ProductPage route
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => OnBoardingPage(),
        );
    }
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay navigation by 2 seconds (adjust the duration as needed)
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'onboarding');
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/favplant.jpg', 
          fit: BoxFit.cover  ,// Display the splash screen image
        ),
      ),
    );
  }
}
 Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Onboarding Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }

// import 'package:device_preview/device_preview.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/my_theme.dart';
// import 'package:flutter_application_1/features/auth/onboarding/view/page/onboarding_page.dart';
// import 'package:flutter_application_1/features/auth/registeration/view/component/confirm_password.dart';
// import 'package:flutter_application_1/features/auth/registeration/view/page/registeration.dart';
// import 'package:flutter_application_1/features/auth/registeration/view/component/loginPage.dart';
// import 'package:flutter_application_1/features/auth/registeration/view/component/forget_password.dart';
// import 'package:flutter_application_1/features/auth/verification/view/page/verification_page.dart';
// import 'package:flutter_application_1/features/dashboard/controller/dashboard_controller.dart';
// import 'package:flutter_application_1/features/dashboard/modules/product/view/page/product_page.dart';
// import 'package:flutter_application_1/features/dashboard/view/page/dashboard_page.dart';
// import 'package:flutter_application_1/firebase_options.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'features/dashboard/modules/new_product/view/page/new_product_page.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(AppInitializer());
// }

// class AppInitializer extends StatefulWidget {
//   @override
//   _AppInitializerState createState() => _AppInitializerState();
// }

// class _AppInitializerState extends State<AppInitializer> {
//   bool _isInitialized = false;
//   bool _onBoarding = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeApp();
//   }

//   Future<void> _initializeApp() async {
//     await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

//     setState(() {
//       _isInitialized = true;
//       _onBoarding = onBoarding;
//     });
//   }

//   @override
//  Widget build(BuildContext context) {
//   if (!_isInitialized) {
//     return MaterialApp(
//       theme: Mytheme.instance.light,
//       darkTheme: Mytheme.instance.dark,
//       themeMode: ThemeMode.dark,
//       home: Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }

//   return DevicePreview(
//     enabled: true,
//     builder: (context) => MaterialApp(
//       theme: Mytheme.instance.light, // Set light theme here
//       darkTheme: Mytheme.instance.dark,
//       themeMode: ThemeMode.dark,
//       initialRoute: _onBoarding ? 'registration' : 'splash',
//       onGenerateRoute: MyRoutes.onGenerateRoute,
//       // Set userInheritedMediaQuery to true
//       // This enables Device Preview to work properly
//       // Device Preview requires this property to be set to true
//       // so that it can manipulate MediaQuery data accordingly
//       builder: (context) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(),
//           child: child,
//         );
//       },
//     ),
//   );
//  }
// class MyRoutes {
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case 'login':
//         return MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => loginPage(),
//         );
//       case 'registration':
//         return MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => Rgister(),
//         );
//       case 'onboarding':
//         return MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => OnboardingPage(),
//         );
//       case 'splash':
//         return MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => SplashScreen(),
//         );
//       case 'dashboard':
//         return MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => DashboardPage(),
//         );
//       case 'confirm_password':
//         return MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => Confirm_pass(),
//         );
//       case 'new_product':
//         return MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => NewProductPage(), // ProductPage route
//         );
//       default:
//         return MaterialPageRoute<dynamic>(
//           builder: (BuildContext context) => OnboardingPage(),
//         );
//     }
//   }
// }

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Delay navigation by 2 seconds (adjust the duration as needed)
//     Future.delayed(Duration(seconds: 5), () {
//       Navigator.pushReplacementNamed(context, 'onboarding');
//     });

//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//           'assets/images/favplant.jpg', // Display the splash screen image
//         ),
//       ),
//     );
//   }
// }

// class OnboardingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Onboarding Page'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'login');
//               },
//               child: Text('Go to Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






