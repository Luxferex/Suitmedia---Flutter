import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/select_user_page_controller.dart';

class SelectUserPageView extends GetView<SelectUserPageController> {
  const SelectUserPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          const Divider(height: 1, thickness: 0.2, color: Colors.grey),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.users.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.users.isEmpty && !controller.isLoading.value) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people_outline, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No users found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: controller.refreshUsers,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        controller.hasMoreData.value &&
                        !controller.isLoadingMore.value) {
                      controller.loadMoreUsers();
                    }
                    return false;
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount:
                        controller.users.length +
                        (controller.hasMoreData.value ? 1 : 0),
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1, color: Colors.grey),
                    itemBuilder: (context, index) {
                      if (index == controller.users.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final user = controller.users[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 0,
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(user.avatar),
                          backgroundColor: Colors.grey[300],
                        ),
                        title: Text(
                          user.fullName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          user.email,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () => controller.selectUser(user),
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
