import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/GetxTask/VideoTask/LanguageTranslate/message.dart';
import 'package:firebase_demo/GetxTask/VideoTask/LanguageTranslate/translation_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/AnimationDialog/home_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/GetConnectAndGetMixin/Screens/popular_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/productmodule/screen/product_list_view_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetxBinding/getx_binding_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GoogleLogin/google_login.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/RedirectLogin/controller/all_controller.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/RedirectLogin/screen/redirect_all_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/add_data_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/auto_complete_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/auto_field_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/bottom_navigation_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/bottom_sheet_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/circle_menu_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/confetti_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/convert_data_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/copy_paste_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/date_picker_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/date_range_picker_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/dependencies_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/direct_phone_call_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/dismiss_keyboard_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/double_tap_to_close_app.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/draggable_fab_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/elegant_button_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/emoji_picker_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/expansion_button_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/fingerprint_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/flip_card_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/floating_button_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/get_storage_email.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/getx_worker.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/image_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/like_button_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/loading_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/multi_select_dropdown_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/multi_select_list_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/multi_select_dialog_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/network_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/number_picker_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/password_textfield.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/qrcode_generate_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/rating_dialog_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/reorderable_list_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/responsive_ui.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/review_slider_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/rotation_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/scratcher_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/screen_shot_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/scrollbar_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/search_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/shrink_side_menu_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/signature_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/stepper_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/strong_password_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/time_picker_screen.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/tv_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Controller/class.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/GetConnectAndGetMixin/Controller/home_binding.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/GetConnectAndGetMixin/Screens/home_view.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetxBinding/binding_home_screen.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetxBinding/getx_binding_controller.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/GoogleLogin/google_all_controller.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/VideoTrim/Controller/video_trim_controller.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/VideoTrim/Screens/video_home_screen.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/VideoTrim/Screens/video_trim_screen.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/location_screen.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/navigation_drawer_screen.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/speech_to_text_screen.dart';
import 'GetxTask/VideoTask/ReactiveStateManageMent/Screens/theme_screen.dart';
import 'GetxTask/VideoTask/general/app_theme.dart';
import 'controller/counter_controller.dart';
import 'controller/task_text_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // GoogleHomeBinding().dependencies();
  await GetStorage.init();
  GetStorage getStorage = GetStorage();
  bool isDarkMode = getStorage.read(GetStorageKey.is_dark_mode) ?? false;
  getStorage.write(GetStorageKey.is_dark_mode, isDarkMode);

  // runApp(
  //   DevicePreview(
  //     builder: (context) => MyApp(),
  //   ),
  // );

  runApp(
      // GetMaterialApp(
      //   home: ScreenShotScreen(),
      //   title: "abc",
      // ),

      MyApp()
      //   ThemeProvider(
      //     initTheme:
      //         isDarkMode ? AppThemes.darkThemeData : AppThemes.lightThemeData,
      //     builder: (context, theme) => GetMaterialApp(
      //       title: 'Flutter Demo',
      //       theme: theme,
      //       darkTheme: AppThemes.darkThemeData,
      //       defaultTransition: Transition.leftToRightWithFade,
      //       debugShowCheckedModeBanner: false,
      //       home: ThemeScreen(),
      //     ),
      //   ),
      );
  // disableCapture();
}

// disableCapture() async {
//   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
// }

class GetViewDemo extends GetView<CountControllerObs> {
  const GetViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerObs());
    // Get.create(() => CountControllerObs());
    return GetMaterialApp(
      title: "getView",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text("${controller.count}"),
              ),
              ElevatedButton(
                onPressed: () {
                  print("${controller.hashCode}");
                  controller.increment();
                },
                child: const Text("increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,

      // theme: AppThemes.lightThemeData,
      // darkTheme: AppThemes.darkThemeData,
      // defaultTransition: Transition.leftToRightWithFade,
      debugShowCheckedModeBanner: false,
      home: FingerPrintScreen(),

      //translation
      // locale: Locale("en", "US"),
      // translations: Message(),
      // fallbackLocale: Locale("en", "US"),
      // home: TranslationScreen(),

      //googleLogin
      // initialRoute: "/ghome",
      // getPages: [
      //   GetPage(
      //     name: "/ghome",
      //     page: () => GoogleHomeScreen(),
      //     binding: GoogleHomeBinding(),
      //   ),
      //   GetPage(
      //     name: "/glogin",
      //     page: () => GoogleLoginScreen(),
      //     binding: GoogleLoginBinding(),
      //   ),
      //   GetPage(
      //     name: "/gwelcome",
      //     page: () => GoogleWelcomeScreen(),
      //     binding: GoogleWelcomeBinding(),
      //   ),
      // ],

      // drawer
      // initialRoute: "/home",
      // getPages: [
      //   GetPage(
      //     name: "/home",
      //     page: () => HomeViewScreen(),
      //   ),
      //   GetPage(
      //     name: "/photo",
      //     page: () => PhotoViewScreen(),
      //   ),
      //   GetPage(
      //     name: "/video",
      //     page: () => VideoViewScreen(),
      //   ),
      //   GetPage(
      //     name: "/chat",
      //     page: () => ChatViewScreen(),
      //   ),
      // ],

      //video trim
      // initialRoute: "/videohome",
      // getPages: [
      //   GetPage(
      //     name: "/videohome",
      //     page: () => VideoHomeScreen(),
      //     binding: VideoHomeBinding(),
      //   ),
      //   GetPage(
      //     name: "/videoTrim",
      //     page: () => VideoTrimScreen(),
      //     binding: VideoTrimBinding(),
      //   ),
      // ],

      //redirect
      // initialRoute: "/splash",
      // getPages: [
      //   GetPage(
      //     name: "/splash",
      //     page: () => ReDirectSplashScreen(),
      //     binding: ReDirectSplashBinding(),
      //   ),
      //   GetPage(
      //     name: "/login",
      //     page: () => ReDirectLoginScreen(),
      //     binding: ReDirectLoginBinding(),
      //   ),
      //   GetPage(
      //     name: "/home",
      //     page: () => ReDirectHomeScreen(),
      //     binding: ReDirectHomeBinding(),
      //   ),
      // ],

      // initialRoute: "/shake",
      // getPages: [
      //   GetPage(
      //     name: "/shake",
      //     page: () => ShakeScreen(),
      //     binding: ShakeBinding(),
      //   )
      // ],
      // theme: ThemeData(
      //   iconTheme: const IconThemeData(color: Colors.black, size: 30),
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.deepPurple,
      //   ),
      //   useMaterial3: true,
      // ),

      //api call get connect and mixin
      // initialRoute: "/homeview",
      // getPages: [
      //   GetPage(
      //     name: "/homeview",
      //     page: () => HomeView(),
      //     binding: HomeBinding(),
      //   ),
      // ],

      //fetch & display data 19
      // home: ProductListViewScreen(),

      // initialRoute: "/network",
      // getPages: [
      //   GetPage(
      //       name: "/network",
      //       page: () => NetworkScreen(),
      //       binding: NetworkBinding()),
      // ],

      //get x binding
      // initialBinding: AllControllerBinding(),
      // initialRoute: "/bhome",
      // getPages: [
      //   GetPage(
      //     name: "/bhome",
      //     page: () => GetXBindingScreen(),
      //   ),
      // ],
      //or
      // initialBinding: AllControllerBinding(),
      // home: GetXBindingScreen(),

      // PreferenceManager.readData(PreferenceManager.userEmailF) == null
      //     ? RegisterScreenFireBase()
      //     : DemoImage()
      // PreferenceManager.readData(PreferenceManager.multiTaskUserEmail) ==
      //             null &&
      //         PreferenceManager.readData(
      //                 PreferenceManager.multiTaskUserMobile) ==
      //             null
      //     ? MainScreenDemo()
      //     : MultiTaskHomeScreen()

      // PreferenceManager.readData(PreferenceManager.userEmail) == null
      //     ? LoginScreen()
      //     : HomeScreen(),
    );
  }

  CounterController counterController = Get.put(CounterController());
  TaskTextController taskTextController = Get.put(TaskTextController());
}
