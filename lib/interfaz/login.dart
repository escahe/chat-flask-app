import 'package:chat/proceso/autenticacion.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final email = TextEditingController();
final password = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login / Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.lock, size: 150, color: Colors.blue),
              ),
              TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      hintText: "Email", suffixIcon: Icon(Icons.email))),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: const InputDecoration(
                        hintText: "Password", suffixIcon: Icon(Icons.key))),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Autenticacion()
                        .iniciarSesion(email.text, password.text)
                        .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(value))));
                  },
                  icon: const Icon(Icons.login),
                  label: const Text("Iniciar Sesion")),
              ElevatedButton.icon(
                  onPressed: () {
                    Autenticacion()
                        .crearUsuario(email.text, password.text)
                        .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(value))));
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text("Registrar Usuarios"))
            ],
          ),
        ),
      ),
    );
  }
}
