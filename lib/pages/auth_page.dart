import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:deep_flutter/controllers/auth_controller.dart';

class AuthPage extends StatelessWidget {
  final controller = Get.put(AuthController());

  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          title: Obx(() => Text(controller.title.value)),
          actions: [
            TextButton(
              onPressed: controller.toggleRegister,
              child: Obx(() => Text(controller.appBarButton.value)),
            )
          ],
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Informe o email corretamente!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: controller.password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Informa sua senha!';
                          } else if (value != null && value.length < 6) {
                            return 'Sua senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState != null &&
                              controller.formKey.currentState!.validate()) {
                            if (controller.isLogin.value) {
                              controller.login();
                            } else {
                              controller.register();
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.check),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Obx(() => Text(controller.mainButton.value,
                                  style: const TextStyle(fontSize: 20))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )));
  }
}
