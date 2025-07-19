import 'package:get/get.dart';
import '../modules/palindromePage/bindings/palindrome_page_binding.dart';
import '../modules/palindromePage/views/palindrome_page_view.dart';
import '../modules/selectUserPage/bindings/select_user_page_binding.dart';
import '../modules/selectUserPage/views/select_user_page_view.dart';
import '../modules/welcomePage/bindings/welcome_page_binding.dart';
import '../modules/welcomePage/views/welcome_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PALINDROME_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.PALINDROME_PAGE,
      page: () => const PalindromePageView(),
      binding: PalindromePageBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_PAGE,
      page: () => const WelcomePageView(),
      binding: WelcomePageBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_USER_PAGE,
      page: () => const SelectUserPageView(),
      binding: SelectUserPageBinding(),
    ),
  ];
}
