import 'package:get/get.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/dummy_data_service.dart';

class SelectUserPageController extends GetxController {
  final users = <User>[].obs;
  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final hasMoreData = true.obs;
  final currentPage = 1.obs;
  final userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Get name from arguments
    if (Get.arguments != null && Get.arguments['name'] != null) {
      userName.value = Get.arguments['name'];
    }
    loadUsers();
  }

  Future<void> loadUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage.value = 1;
      hasMoreData.value = true;
      users.clear();
    }

    if (currentPage.value == 1) {
      isLoading.value = true;
    } else {
      isLoadingMore.value = true;
    }

    try {
      List<User> newUsers;

      if (currentPage.value == 1) {
        newUsers = await DummyDataService.getUsers(page: 1);
      } else {
        newUsers = await DummyDataService.getMoreUsers(page: currentPage.value);
      }

      if (isRefresh) {
        users.value = newUsers;
      } else {
        users.addAll(newUsers);
      }

      // Simulate pagination - has more data only if current page is 1
      hasMoreData.value = currentPage.value == 1;
      currentPage.value++;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load users: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  Future<void> refreshUsers() async {
    await loadUsers(isRefresh: true);
  }

  void loadMoreUsers() {
    if (!isLoadingMore.value && hasMoreData.value) {
      loadUsers();
    }
  }

  void selectUser(User user) {
    // Navigate back to welcome page with selected user
    Get.back(result: {'selectedUser': user.fullName, 'name': userName.value});
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
