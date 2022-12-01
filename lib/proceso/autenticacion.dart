import 'package:firebase_auth/firebase_auth.dart';

class Autenticacion {
  final FirebaseAuth fire = FirebaseAuth.instance;
  User? get usuarios => fire.currentUser;
  Stream<User?> get estadoLogin => fire.authStateChanges();

  Future<String> iniciarSesion(String email, String password) async {
    try {
      await fire.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-passord') {
        return "Usuario no encontrado o contraseña inválida";
      }
      if (e.code == 'invalid-email') {
        return "Escriba un email válido";
      }
      return "Error inesperado, vuelva a intentarlo.";
    }
    return "Inicio de sesión exitoso";
  }

  Future<String> crearUsuario(String email, String password) async {
    try {
      await fire.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "No se puede registrar, email en uso.";
      }
      if (e.code == 'invalid-email') {
        return "Escriba un email válido";
      }
      if (e.code == 'weak-password') {
        return "Contraseña muy débil.";
      }
      return "Error inesperado, vuelva a intentarlo.";
    }
    return "$email, registrado exitosamente. Ya puede chatear";
  }

  Future<void> cerrarSesion() async {
    await fire.signOut();
  }
}
