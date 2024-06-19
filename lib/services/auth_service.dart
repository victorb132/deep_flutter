import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();

  RxBool userIsAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());

    ever(_firebaseUser, (User? user) {
      if (user == null) {
        userIsAuthenticated.value = false;
      } else {
        userIsAuthenticated.value = true;
      }
    });
  }

  User? get user => _firebaseUser.value;

  static AuthService get to => Get.find<AuthService>();

  showSnack(String title, String error) {
    Get.snackbar(
      title,
      error,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.snackBarTheme.backgroundColor,
      colorText: Get.theme.snackBarTheme.actionTextColor,
    );
  }

  createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      showSnack('Erro ao registrar!', e.message ?? 'Erro desconhecido!');
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      showSnack('Erro ao logar!', e.message ?? 'Erro desconhecido!');
    }
  }

  logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnack('Erro ao sair!', e.message ?? 'Erro desconhecido!');
    }
  }
}
