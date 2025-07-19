import 'package:get/get.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/api_service.dart'; // Ganti dari dummy_data_service

class SelectUserPageController extends GetxController {
  final users = <User>[].obs;
  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final hasMoreData = true.obs;
  final currentPage = 1.obs;
  final userName = ''.obs;
  final totalPages = 1.obs;

  @override
  void onInit() {
    super.onInit();
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
      // Gunakan API Service yang baru
      final response = await ApiService.getUsers(
        page: currentPage.value,
        perPage: 10,
      );

      if (isRefresh) {
        users.value = response.data;
      } else {
        users.addAll(response.data);
      }

      // Update pagination info dari API response
      totalPages.value = response.totalPages;
      hasMoreData.value = currentPage.value < totalPages.value;
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
