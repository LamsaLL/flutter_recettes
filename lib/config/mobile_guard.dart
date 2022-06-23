import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

class MobileGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // Login Route is only available on mobile
    if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
      resolver.next(true);
    } else {
      resolver.next(false);
      router.navigateNamed('/404');
    }
  }
}
