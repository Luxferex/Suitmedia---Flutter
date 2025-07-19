import 'package:get/get.dart';

class WelcomePageController extends GetxController {
  final userName = ''.obs;
  final selectedUserName = 'Selected User Name'.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['name'] != null) {
      userName.value = Get.arguments['name'];
    }
    if (Get.arguments != null && Get.arguments['selectedUser'] != null) {
      selectedUserName.value = Get.arguments['selectedUser'];
    }
  }

  Future<void> goToSelectUserPage() async {
    final result = await Get.toNamed(
      '/select-user-page',
      arguments: {'name': userName.value},
    );

    // Update user dipilih
    if (result != null && result['selectedUser'] != null) {
      selectedUserName.value = result['selectedUser'];
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
