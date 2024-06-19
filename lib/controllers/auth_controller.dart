import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:deep_flutter/services/auth_service.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxString title = 'Bem vindo!'.obs;
  RxString mainButton = 'Entrar'.obs;
  RxString appBarButton = 'Cadastre-se'.obs;
  RxBool isLogin = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(isLogin, (visible) {
      title.value = visible ? 'Bem vindo!' : 'Crie sua conta!';
      mainButton.value = visible ? 'Entrar' : 'Registre-se';
      appBarButton.value = visible ? 'Cadastre-se' : 'Entrar';
      formKey.currentState?.reset();
    });
  }

  resetState() {
    email.clear();
    password.clear();
    isLoading.value = false;
  }

  login() async {
    isLoading.value = true;
    await AuthService.to.login(email.text, password.text);
    resetState();
  }

  register() async {
    isLoading.value = true;
    await AuthService.to.createUser(email.text, password.text);
    resetState();
  }

  toggleRegister() {
    isLogin.value = !isLogin.value;
  }
}
