import 'package:deep_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:deep_flutter/pages/auth_page.dart';
import 'package:deep_flutter/pages/home_page.dart';

class CheckAuth extends StatelessWidget {
  final bool userIsAuthenticated = false;

  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AuthService.to.userIsAuthenticated.value
          ? const HomePage()
          : AuthPage(),
    );
  }
}
