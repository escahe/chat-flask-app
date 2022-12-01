import 'package:chat/proceso/autenticacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({super.key});

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  Stream<QuerySnapshot> respConsulta = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("tiempo", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: respConsulta,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return ListView.builder(
            itemCount: respuesta.data != null ? respuesta.data!.docs.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: (Autenticacion().usuarios?.email) ==
                        respuesta.data!.docs[index].get("email")
                    ? Colors.green[100]
                    : Colors.red[100],
                child: ListTile(
                  title: Text(
                    respuesta.data!.docs[index].get("mensaje"),
                    textAlign: (Autenticacion().usuarios?.email) ==
                            respuesta.data!.docs[index].get("email")
                        ? TextAlign.left
                        : TextAlign.right,
                  ),
                  subtitle: Text(respuesta.data!.docs[index].get("email"),
                      textAlign: (Autenticacion().usuarios?.email) ==
                              respuesta.data!.docs[index].get("email")
                          ? TextAlign.left
                          : TextAlign.right),
                ),
              );
            },
          );
        });
  }
}
