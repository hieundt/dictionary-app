import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_sceen.dart';
import 'screens/training/tests_screen/test_topics_screen.dart';
import 'screens/training/units_screen/unit_topics_screen.dart';
import 'screens/user/favorite_unit_screen.dart';
import 'screens/user/favorite_vocabulary_screen.dart';
import 'screens/user/test_history.dart';

class AppRoutes {
  static const initial = '/';

  static const home = '/home';

  static const unitTopics = '/unitTopics';
  static const testTopics = '/testTopics';

  static const favoriteUnit = '/favoriteUnit';
  static const favoriteVocabulary = '/favoriteVocabulary';
  static const testHistory = '/testHistory';

  static const signup = '/signup';
  static const login = '/login';
}

var appRoutes = {
  //AppRoutes.initial: (context) => const InitialState(),
  AppRoutes.home: (context) => const HomeScreen(),
  AppRoutes.unitTopics: (context) => const UnitTopicsScreen(),
  AppRoutes.testTopics: (context) => const TestTopicsScreen(),
  AppRoutes.favoriteUnit: (context) => const FavoriteUnitScreen(),
  AppRoutes.favoriteVocabulary: (context) => const FavoriteVocabularyScreen(),
  AppRoutes.testHistory: (context) => const TestHistoryScreen(),
  AppRoutes.signup: (context) => const SignUpScreen(),
  AppRoutes.login: (context) => const LoginScreen(),
};
