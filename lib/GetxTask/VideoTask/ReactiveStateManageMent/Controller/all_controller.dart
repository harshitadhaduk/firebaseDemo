import 'dart:async';
import 'dart:developer';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:chewie/chewie.dart';
import 'package:confetti/confetti.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/productmodule/ApiModule/api_services.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/productmodule/model/tv_model.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:scratcher/scratcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:signature/signature.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:video_player/video_player.dart';
import '../../general/app_theme.dart';
import 'dart:io';
import 'class.dart';
import 'package:local_auth_android/local_auth_android.dart';

class CountControllerObs extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}

class CountControllerObs2 extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}

class CountControllerSimple extends GetxController {
  var count = 0;
  void increment() {
    count++;
    update();
    //update(["demo"]);
  }
}

class DependenciesController extends GetxController {
  void incrementCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = (sharedPreferences.getInt("counter") ?? 0) + 1;
    print("pressed $count time");
    await sharedPreferences.setInt("counter", count);
  }
}

class DraggableScrollController extends GetxController {
  List<bool> selected = List.generate(40, (index) => false).obs;
}

class GetXWorkerController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }

  @override
  void onInit() {
    //called every time when the value of count variable change
    //ever(count, (_) => print(count));

    //called every time when the value of any variable from the list change
    // everAll([count], (_) => print(count));

    //called only once when the variable value change
    //once(count, (_) => print(count));

    //called every time the user stops typing for 1 seconds
    // debounce(
    //   count,
    //   (_) => print("$count"),
    //   time: Duration(seconds: 1),
    // );

    interval(count, (callback) => print("$count"), time: Duration(seconds: 5));

    super.onInit();
  }
}

class ImageController extends GetxController {
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;

  //crop code
  var cropImagePath = "".obs;
  var cropImageSize = "".obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";

      // crop code
      //   final cropImage = await ImageCropper().cropImage(
      //       sourcePath: selectedImagePath.value,
      //       maxWidth: 512,
      //       maxHeight: 512,
      //       compressFormat: ImageCompressFormat.jpg);
      //   cropImagePath.value = cropImage!.path;
      //   cropImageSize.value =
      //       "${((File(cropImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
      // } else {
      //   Get.snackbar("Error", "No image selected",
      //       snackPosition: SnackPosition.BOTTOM);
    }
  }
}

class LifeCycleController extends GetxController {
  var count = 0;
  void increment() async {
    await Future.delayed(const Duration(seconds: 3));
    count++;
    update();
  }

  void cleanupTask() {
    print("clean Up Task");
  }

  @override
  void onInit() {
    print("on Init");
    super.onInit();
  }
}

class MultiPlayerController extends GetxController {
  List<Players> player = [
    Players(name: "Virat kohli"),
    Players(name: "Rohit sharma"),
    Players(name: "Aaron Finch"),
    Players(name: "Jason holder"),
    Players(name: "M s dhoni"),
    Players(name: "Shabhman gill"),
    Players(name: "Glenn maxwell"),
  ];

  List<dynamic> selectedPlayer = [];
  var selectPlayerValue = "".obs;

  void showMultiSelect() async {
    await showDialog(
      context: Get.context!,
      builder: (con) {
        return MultiSelectDialog(
          initialValue: selectedPlayer,
          selectedColor: Colors.blue,
          items: player
              .map((player) => MultiSelectItem<Players>(player, player.name!))
              .toList(),
          onConfirm: (result) {
            selectedPlayer = result;
            selectPlayerValue.value = "";
            for (var element in selectedPlayer) {
              selectPlayerValue.value =
                  "${selectPlayerValue.value} " + element.name;
            }
          },
          searchable: true,
          listType: MultiSelectListType.LIST,
        );
      },
    );
  }
}

class MultiSelectListController extends GetxController {
  List<Employees> list = [];

  @override
  void onInit() {
    super.onInit();
    List.generate(
      20,
      (index) => list.add(
        Employees(name: "$index", isSelected: false.obs),
      ),
    );
  }
}

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> streamSubscription;
  late List<ConnectivityResult> result;
  late ConnectivityResult finalConnectivityResult;
  Future<void> connection() async {
    try {
      result = (await connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e.toString());
    }
    for (ConnectivityResult element in result) {
      finalConnectivityResult = element;
      return _updateConnection(finalConnectivityResult);
    }
  }

  void _updateConnection(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;
      default:
        Get.snackbar("Network Error", "Failed to get network connection");
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    connection();
  }

  @override
  void onClose() {
    super.onClose();
    streamSubscription.cancel();
  }
}

class PasswordController extends GetxController {
  var isPasswordHidden = true.obs;
}

class RotationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  var isAnimating = false.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }

  void startAnimation() {
    if (animationController.isAnimating) {
      isAnimating.value = false;
      animationController.stop();
    } else {
      isAnimating.value = true;
      animationController.forward();
      animationController.repeat();
    }
  }
}

class StudentController extends GetxController {
  // var student = Student();
  // void convertUpperCase() {
  //   student.name.value = student.name.value.toUpperCase();
  // }

  var student = Student(name: "bheem", age: 19).obs;

  void convertToUpperClass() {
    student.update((val) {
      val?.name = val.name.toString().toUpperCase();
    });
  }
}

class ScrollNotificationController extends GetxController {
  var scrollMsg = "".obs;
  var scrollNotificationMsg = "".obs;
  late ScrollController scrollController;

  void scrollUp() {
    scrollController.animateTo(scrollController.offset - 50,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);

    scrollController.jumpTo(scrollController.offset - 50);
  }

  void scrollDown() {
    scrollController.animateTo(scrollController.offset + 50,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    scrollController.jumpTo(scrollController.offset + 50);
  }

  void start() {
    scrollNotificationMsg.value = "Started";
  }

  void updateData() {
    scrollNotificationMsg.value = "Update";
  }

  void ended() {
    scrollNotificationMsg.value = "Ended";
  }

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollMsg.value = "Reached at bottom";
      }
      if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollMsg.value = "Reached at Top";
      }
    });
  }
}

class VideoController extends GetxController {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  Future<void> initializedPlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));

    await Future.wait([videoPlayerController!.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.cyanAccent,
        backgroundColor: Colors.yellow,
        bufferedColor: Colors.green,
      ),
      placeholder: Container(
        color: Colors.greenAccent,
      ),
      autoInitialize: true,
    );
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initializedPlayer();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController?.dispose();
    chewieController?.dispose();
  }
}

class CopyPasteController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  var text = "".obs;

  void copyData(String text) {
    Clipboard.setData(
      ClipboardData(text: text),
    );
  }

  void pasteData() async {
    ClipboardData? clipboard = await Clipboard.getData("text/plain");
    text.value = clipboard!.text!;
  }
}

class AutoValidationController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var email = "";
  var password = "";

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    } else {
      return null;
    }
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}

class DragTargetController extends GetxController {
  List<int> number = [1, 2, 3, 4, 5].obs;

  void restartGame() {
    number.addAll([1, 2, 3, 4, 5]);
  }

  void checkController(int data, int acceptType) {
    if (data % 2 == 0) {
      if (acceptType == 1) {
        showSnackBar("Correct Answer", Colors.green);
      }
      if (acceptType == 0) {
        showSnackBar("InCorrect Answer", Colors.red);
      }
      number.removeWhere((element) => element == data);
    } else if (data % 2 != 0) {
      if (acceptType == 0) {
        showSnackBar("Correct Answer", Colors.green);
      } else {
        showSnackBar("InCorrect Answer", Colors.red);
      }
      number.removeWhere((element) => element == data);
    }
  }

  void showSnackBar(String msg, Color color) {
    Get.snackbar("Status", msg,
        snackPosition: SnackPosition.BOTTOM, backgroundColor: color);
  }
}

class LikeButtonController extends GetxController {
  var count = 0;
  GetStorage getStorage = GetStorage();

  Future<bool> saveLikeCount(bool isLiked) async {
    getStorage.write("isLiked", !isLiked);
    if (!isLiked) {
      count++;
    } else {
      count > 0 ? count-- : 0;
    }
    getStorage.write("likeCount", count);
    return !isLiked;
  }
}

class ShrinkSideController extends GetxController {
  GlobalKey<SideMenuState> globalKey = GlobalKey<SideMenuState>();

  void openCloseButton() {
    globalKey.currentState!.isOpened
        ? globalKey.currentState!.closeSideMenu()
        : globalKey.currentState!.openSideMenu();
  }
}

class ThemeController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController mobileNoController = TextEditingController();
  bool isFormValid = false;
  GetStorage getStorage = GetStorage();
  var isDarkMode = false.obs;

  void changeTheme(BuildContext context) {
    final theme =
        Get.isDarkMode ? AppThemes.lightThemeData : AppThemes.darkThemeData;
    ThemeSwitcher.of(context).changeTheme(theme: theme);
    if (getStorage.read(GetStorageKey.is_dark_mode)) {
      getStorage.write(GetStorageKey.is_dark_mode, false);
      isDarkMode.value = false;
    } else {
      getStorage.write(GetStorageKey.is_dark_mode, true);
      isDarkMode.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    isDarkMode.value = getStorage.read(GetStorageKey.is_dark_mode);
  }

  @override
  void onClose() {
    super.onClose();
    mobileNoController.dispose();
  }

  String? validateMobile(String value) {
    if (value.length < 10) {
      return "Provide valid Mobile Number";
    } else {
      return null;
    }
  }

  void validateAndCheckMobileNumber(String mobileNumber) {
    isFormValid = formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    } else {
      formKey.currentState!.save();
    }
  }
}

class ReOrderableListController extends GetxController {
  List<String> language = [
    "Java",
    "Kotlin",
    "Flutter",
    "Dart",
    "React Js",
  ].obs;

  void reorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = language.removeAt(oldIndex);
    language.insert(newIndex, items);
  }
}

class BottomNavigationController extends GetxController {
  late PageController pageController;
  var currentIndex = 0.obs;
  GlobalKey globalKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}

class QrCodeController extends GetxController {
  TextEditingController qrCode = TextEditingController();
  var qrImage = "".obs;
  String scannedQrcode = "";

  Future<void> scanQr() async {
    try {
      scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );
      Get.snackbar(
        "Result",
        "QR Code$scannedQrcode",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on PlatformException {
      Get.snackbar(
        "Error",
        "QR Code",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

class ReviewController extends GetxController {
  var select = 0.obs;
}

class RatingDialogController extends GetxController {
  var rating = 0.0.obs;
  var comment = "".obs;

  void showDialog() {
    Get.dialog(
      RatingDialog(
        title: const Text("rating Dialog"),
        submitButtonText: "Submit",
        onSubmitted: (p0) {
          rating.value = p0.rating;
          comment.value = p0.comment;
        },
        starColor: Colors.orange,
        message: const Text(
            "Tap as star to set your rating.add more description here if you want."),
        onCancelled: () => print("Cancelled"),
      ),
    );
  }
}

class ConfettiDemoController extends GetxController {
  var isPlaying = false.obs;
  late ConfettiController controller;

  @override
  void onInit() {
    super.onInit();
    controller = ConfettiController();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }

  void confettiAnimation() {
    if (controller.state == ConfettiControllerState.playing) {
      isPlaying.value = false;
      controller.stop();
    } else {
      isPlaying.value = true;
      controller.play();
    }
  }
}

class NumberController extends GetxController {
  var currentNumber = 20.obs;
}

class EmojiController extends GetxController {
  var isEmojiVisible = false.obs;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojiVisible.value = false;
      }
    });
  }
}

class DatePickerController extends GetxController {
  var selectDate = DateTime.now().obs;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2027),
      // initialEntryMode: DatePickerEntryMode.input,
      //initialDatePickerMode: DatePickerMode.year,
      helpText: "Select DOB",
      cancelText: "Close",
      confirmText: "Confirm",
      errorFormatText: "Enter valid date",
      errorInvalidText: "Enter valid date range",
      fieldLabelText: "DOB",
      fieldHintText: "Month/Date/Year",
      selectableDayPredicate: disableDate,
    );
    if (pickedDate != null && pickedDate != selectDate.value) {
      selectDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if (day.isAfter(DateTime.now().subtract(const Duration(days: 10))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 10)))) {
      return true;
    }
    return false;
  }
}

class TimePickerController extends GetxController {
  var selectedTime = TimeOfDay.now().obs;

  chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child!);
      },
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }
}

class DateRangeController extends GetxController {
  var dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 6,
    ),
  ).obs;

  chooseDateRange() async {
    DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: Get.context!,
      firstDate: (DateTime(DateTime.now().year - 20)),
      lastDate: DateTime(DateTime.now().year + 20),
      initialDateRange: dateRange.value,
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child!);
      },
    );
    if (pickedDateRange != null && pickedDateRange != dateRange.value) {
      dateRange.value = pickedDateRange;
    }
  }
}

class ElegantButtonController extends GetxController {
  RxNum defaultValue = RxNum(10.0);
}

class ExpansionController extends GetxController {
  late List<ExpansionEmployee> employeeList;

  @override
  void onInit() {
    super.onInit();
    employeeList = generateList(20);
  }

  List<ExpansionEmployee> generateList(int numberOfItems) {
    return List.generate(numberOfItems, (index) {
      return ExpansionEmployee(
        body: "Employee Details- $index",
        isExpanded: false.obs,
        header: "Employee - $index",
      );
    });
  }
}

class SearchDemoController extends GetxController {
  List<Map<String, dynamic>> allPlayer = [
    {"name": "Virat Kohli", "country": "India"},
    {"name": "Rohit Sharma", "country": "India"},
    {"name": "Glenn Maxwell", "country": "Australia"},
    {"name": "Aaron Finch", "country": "Australia"},
    {"name": "Jason Holder", "country": "West Indies"},
  ];

  Rx<List<Map<String, dynamic>>> foundPlayer =
      Rx<List<Map<String, dynamic>>>([]);
  @override
  void onInit() {
    super.onInit();
    foundPlayer.value = allPlayer;
  }

  void filterPlayer(String playerName) {
    List<Map<String, dynamic>> result = [];
    if (playerName.isEmpty) {
      result = allPlayer;
    } else {
      result = allPlayer
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    }
    foundPlayer.value = result;
  }
}

class LoadingController extends GetxController {
  var isLoading = false.obs;
  void uploadFile() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
  }
}

class FlipController extends GetxController {
  FlipCardController flipCardController = FlipCardController();
}

// class ShakeDemoController extends GetxController {
//   var color = Colors.blue.obs;
//
//   late ShakeDetector shakeDetector;
//
//   @override
//   void onInit() {
//     super.onInit();
//     shakeDetector = ShakeDetector.autoStart(
//       onPhoneShake: () {
//         color.value = Colors.orange;
//         // Colors.primaries[Random().nextInt(Colors.primaries.length)];
//       },
//     );
//     shakeDetector.startListening();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     shakeDetector.stopListening();
//   }
// }

class MultiSelectDropdownController extends GetxController {
  List<String> options = ["Getx", "Provider", "BloC", "MobX"];
  Rx<List<String>> selectOptionList = Rx<List<String>>([]);
  var selectOption = "".obs;
}

class CircleMenuController extends GetxController {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  openCloseFabMenu() {
    fabKey.currentState!.isOpen
        ? fabKey.currentState!.close()
        : fabKey.currentState!.open();
  }
}

class PanoramaController extends GetxController {
  var selectImagePath = "".obs;
  void getImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(source: imageSource);
    if (pickedImage.toString().isNotEmpty) {
      selectImagePath.value = pickedImage!.path;
    }
  }
}

class ConvertDataController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    var result = convertToNumber("30");
    result.fold(
      (l) => print("Error :$l"),
      (r) => print("Result :$r"),
    );
  }

  Either<String, int> convertToNumber(String input) {
    try {
      return Right(int.parse(input));
    } catch (e) {
      return Left(e.toString());
    }
  }
}

class AutoFieldController extends GetxController {
  CountdownController countdownController = CountdownController();
  TextEditingController textEditingController = TextEditingController();
  var msgOtpCode = "".obs;

  @override
  void onInit() async {
    super.onInit();
    print(SmsAutoFill().getAppSignature);
  }

  @override
  void onReady() {
    super.onReady();
    countdownController.start();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
    SmsAutoFill().unregisterListener();
  }
}

class ScrollbarController extends GetxController {
  late ScrollController scrollController;
  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}

class AutoCompleteController extends GetxController {
  late List<CountryAutoComplete> countryName;
  @override
  void onInit() {
    super.onInit();
    countryName = <CountryAutoComplete>[
      CountryAutoComplete(name: "India"),
      CountryAutoComplete(name: "Australia"),
      CountryAutoComplete(name: "Africa"),
      CountryAutoComplete(name: "Indonesia"),
      CountryAutoComplete(name: "Japan"),
      CountryAutoComplete(name: "Chin"),
    ];
  }
}

class LocationController extends GetxController {
  var latitude = "Getting Latitude...".obs;
  var longitude = "Getting Longitude...".obs;
  var address = "Getting Address...".obs;
  late StreamSubscription<Position> streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location services are disabled.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return Future.error("Location services are denied.");
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permission are permanently denied, we cannot request permission.");
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = "Latitude : ${position.latitude}";
      longitude.value = "Longitude : ${position.longitude}";
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMark[0];
    address.value = "Address : ${place.locality},${place.country}";
  }
}

class ScreenShotController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    disableCapture();
  }

  disableCapture() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
}

class StepperDemoController extends GetxController {
  var currentStep = 0.obs;
}

class StrongPasswordController extends GetxController {
  var password = "".obs;
  var displayText = "Enter a Password".obs;
  var passwordStrength = 0.0.obs;
  RegExp numRegExp = RegExp(r".*[0-9].*");
  RegExp letterRegExp = RegExp(r".*[A-Za-z].*");

  void checkPasswordStrength(String value) {
    password.value = value.trim();
    if (password.value.isEmpty) {
      passwordStrength.value = 0.0;
      displayText.value = "Enter a password";
    } else if (password.value.length < 6) {
      passwordStrength.value = 1 / 4;
      displayText.value = "password too short";
    } else if (password.value.length < 8) {
      passwordStrength.value = 2 / 4;
      displayText.value = "password not strong";
    } else {
      if (!letterRegExp.hasMatch(password.value) ||
          !numRegExp.hasMatch(password.value)) {
        passwordStrength.value = 3 / 4;
        displayText.value = "password strong";
      } else {
        passwordStrength.value = 1;
        displayText.value = "password strongest";
      }
    }
  }
}

class BottomSheetController extends GetxController {
  GlobalKey<ExpandableBottomSheetState> globalKey = GlobalKey();
  var expansionStatus = ExpansionStatus.contracted.obs;
}

class ShortCutController extends GetxController {
  final QuickActions quickActions = const QuickActions();

  @override
  void onInit() {
    super.onInit();
    quickActions.setShortcutItems(
      <ShortcutItem>[
        const ShortcutItem(type: "action_setting", localizedTitle: "Setting"),
        const ShortcutItem(type: "action_help", localizedTitle: "Help"),
      ],
    );
    quickActions.initialize((type) {
      if (type == "action_setting") {
      } else if (type == "action_help") {}
    });
  }
}

class ScratchController extends GetxController {
  var scratchProgress = 0.0.obs;
  var isThreshHolderReached = false.obs;
  final scratchKey = GlobalKey<ScratcherState>();
}

class TvController extends GetxController with StateMixin<List<TvShow>> {
  TvShowRepository tvShowRepository;
  TvController(this.tvShowRepository);
  List<TvShow> isTvShow = [];

  @override
  void onReady() {
    super.onReady();
    getTvShow();
  }

  getTvShow() async {
    try {
      change(null, status: RxStatus.loading());
      tvShowRepository.getTvShow("1").then((value) {
        isTvShow.clear();
        isTvShow.addAll(value.tvShows);
        change(isTvShow, status: RxStatus.success());
      }, onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

class FingerPrintController extends GetxController {
  LocalAuthentication localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;

  void getAllBiometrics() async {
    log("CALLED");
    bool hasLocalAuthentication = await localAuth.canCheckBiometrics;

    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometrics =
          await localAuth.getAvailableBiometrics();

      log("VALUE ${availableBiometrics}");

      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasFingerPrintLock.value =
          availableBiometrics.contains(BiometricType.fingerprint);
    } else {
      Get.snackbar(
        "Error",
        "Local authentication not available",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllBiometrics();
  }

  void authenticateUser() async {
    try {
      isUserAuthenticated.value = await localAuth.authenticate(
        localizedReason: "Authenticate yourSelf",
        authMessages: [
          const AndroidAuthMessages(
            cancelButton: "Cancel",
            goToSettingsButton: "settings",
            goToSettingsDescription: "Please set up your fingerPrint/faceLock.",
            biometricHint: "verify your identity.",
          ),
        ],
        options: const AuthenticationOptions(
          biometricOnly: true,
          sensitiveTransaction: true,
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (isUserAuthenticated.value) {
        hasFingerPrintLock.value = true;
        hasFaceLock.value = true;
        Get.snackbar(
          "Success",
          "you are authenticated",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
      } else {
        hasFingerPrintLock.value = false;
        hasFaceLock.value = false;
        Get.snackbar(
          "Error",
          "authenticated cancelled",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }
}

class SpeechToTextController extends GetxController {
  var isListening = false.obs;
  var speechText = "press the mic button and start speaking".obs;
  late SpeechToText speechToText;
  @override
  void onInit() {
    super.onInit();
    speechToText = SpeechToText();
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await speechToText.initialize(
        onStatus: (status) {},
        onError: (errorNotification) {},
      );
      if (available) {
        isListening.value = true;
        speechToText.listen(
          onResult: (result) {
            speechText.value = result.recognizedWords;
          },
        );
      }
    } else {
      isListening.value = false;
      speechToText.stop();
      speechText.value = "";
    }
  }
}

class SignatureControllerDemo extends GetxController {
  late SignatureController signatureController;
  var padColor = Colors.black.obs;
  var penColor = Colors.white.obs;
  @override
  void onInit() {
    super.onInit();
    initializeSignatureController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    signatureController.dispose();
  }

  void initializeSignatureController() {
    signatureController =
        SignatureController(penColor: penColor.value, penStrokeWidth: 5);
  }

  void selectPadColor() {
    Get.dialog(Center(
      child: Dialog(
        child: ColorPicker(
          pickerColor: padColor.value,
          onColorChanged: (value) {
            padColor.value = value;
          },
          showLabel: true,
          pickerAreaHeightPercent: .8,
        ),
      ),
    ));
  }

  void selectPenColor() {
    Get.dialog(Center(
      child: Dialog(
        child: ColorPicker(
          pickerColor: penColor.value,
          onColorChanged: (color) {
            penColor.value = color;
            initializeSignatureController();
          },
          showLabel: true,
          pickerAreaHeightPercent: .8,
        ),
      ),
    ));
  }

  void exportSignature() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if (signatureController.isNotEmpty) {
      final exportSignature = SignatureController(
          penColor: penColor.value,
          penStrokeWidth: 5,
          exportBackgroundColor: padColor.value,
          points: signatureController.points);
      final signature = await exportSignature.toPngBytes();
      exportSignature.dispose();
      // final result = await ImageGallerySaver.saveIamge(signature!,
      //     name: "MySignature.png");
      // final isExported = result["isSuccess"];
      // if (isExported) {
      //   Get.snackbar(
      //     "Error",
      //     "Signature Exported",
      //     backgroundColor: Colors.green,
      //     colorText: Colors.white,
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      // } else {
      //   Get.snackbar(
      //     "Error",
      //     "Signature Not Exported",
      //     backgroundColor: Colors.red,
      //     colorText: Colors.white,
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      // }
    } else {
      Get.snackbar(
        "Error",
        "Provide Signature",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class AddDataController extends GetxController {
  Rx<List<EmployeesModel>> employees = Rx<List<EmployeesModel>>([]);
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  late EmployeesModel employeeModel;
  var itemCount = 0.obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    addressController.dispose();
  }

  addEmployee(String name, String address) {
    employeeModel = EmployeesModel(name: name, address: address);
    employees.value.add(employeeModel);
    itemCount.value = employees.value.length;
    nameController.clear();
    addressController.clear();
  }

  removeEmployee(int index) {
    employees.value.removeAt(index);
    itemCount.value = employees.value.length;
  }
}
