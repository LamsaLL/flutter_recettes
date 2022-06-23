import 'app_auto_router.gr.dart';

// AppRouter singleton
class AppRouter {
  static AppAutoRouter? _instance;

  static void init(AppAutoRouter appAutoRouter) {
    _instance = appAutoRouter;
  }

  static AppAutoRouter get instance {
    if (_instance == null) {
      throw 'AppRouter is not initialized, did you forget to call AppRouter.init() ?';
    }
    return _instance!;
  }
}
