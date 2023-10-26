import 'package:get/get.dart';

import '../screen/login_screen.dart';
import '../screen/splah_screen.dart';

class Routes {
  static String splashScreen = '/splashScreen';

  static String androidMainPage = '/androidMainPage';

  static String loginScreen = '/loginPage';

  static String createAccount = '/createAccount';

  static String cardPage = '/cardPage';

  static String categoryPage = '/categoryPage';

  static String detailsPage = '/detailsPage';

  static String homePage = '/homePage';

  static String productPage = '/productPage';
}

appRoutes() => [
      /*  GetPage(
        name: Routes.androidMainPage,
        page: () => AndroidMainPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),*/
      GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
      /*  GetPage(
        name: Routes.createAccount,
        page: () => CreateAccount(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),*/
      GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      /*  GetPage(
        name: Routes.cardPage,
        page: () => CardPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.categoryPage,
        page: () => CategoryPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.homePage,
        page: () => HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.productPage,
        page: () => ProductPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      )*/
    ];
