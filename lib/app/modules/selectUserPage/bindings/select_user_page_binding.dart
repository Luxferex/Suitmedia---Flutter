import 'package:get/get.dart';

import '../controllers/select_user_page_controller.dart';

class SelectUserPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectUserPageController>(
      () => SelectUserPageController(),
    );
  }
}
