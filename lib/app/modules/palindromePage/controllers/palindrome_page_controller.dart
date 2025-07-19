import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PalindromePageController extends GetxController {
  final nameController = TextEditingController();
  final sentenceController = TextEditingController();
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    sentenceController.dispose();
    super.onClose();
  }

  bool isPalindrome(String text) {
    // Remove spaces and convert to lowercase
    String cleanText = text.replaceAll(' ', '').toLowerCase();
    
    // Check if the string is equal to its reverse
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }

  void checkPalindrome() {
    String sentence = sentenceController.text.trim();
    
    if (sentence.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a sentence to check',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    bool result = isPalindrome(sentence);
    
    Get.dialog(
      AlertDialog(
        title: const Text('Result'),
        content: Text(result ? 'isPalindrome' : 'not palindrome'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void goToWelcomePage() {
    String name = nameController.text.trim();
    
    if (name.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your name',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.toNamed('/welcome-page', arguments: {'name': name});
  }
}
