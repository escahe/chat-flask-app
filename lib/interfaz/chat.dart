import 'package:chat/interfaz/mensajes.dart';
import 'package:chat/proceso/autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Autenticacion().cerrarSesion();
                },
                icon: const Icon(Icons.logout)),
            const VerticalDivider(),
            Text((Autenticacion().usuarios?.email).toString())
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: mensaje,
                    decoration: const InputDecoration(hintText: "Mensaje..."),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (mensaje.text.isNotEmpty) {
                        fire.collection("Chat").doc().set({
                          "mensaje": mensaje.text,
                          "tiempo": DateTime.now(),
                          "email": (Autenticacion().usuarios?.email).toString()
                        });

                        mensaje.clear();
                      }
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
            const Expanded(child: Mensajes())
          ],
        ),
      ),
    );
  }
}
