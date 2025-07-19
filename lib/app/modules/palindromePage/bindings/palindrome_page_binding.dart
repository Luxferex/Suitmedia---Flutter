import 'package:get/get.dart';

import '../controllers/palindrome_page_controller.dart';

class PalindromePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PalindromePageController>(
      () => PalindromePageController(),
    );
  }
}
