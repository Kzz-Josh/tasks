import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Firestore"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                tasksReference.get().then((QuerySnapshot value) {
                  // QuerySnapshot collection = value;
                  // List<QueryDocumentSnapshot> docs = collection.docs;
                  // QueryDocumentSnapshot doc = docs[1];
                  // print(doc.id);
                  // print(doc.data());
                  QuerySnapshot collection = value;
                  collection.docs.forEach((QueryDocumentSnapshot element) {
                    Map<String, dynamic> myMap =
                        element.data() as Map<String, dynamic>;
                    print(myMap["title"]);
                  });
                });
              },
              child: Text(
                "Obtener la data",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.add(
                  {
                    "title": "Ir de compras al super 3",
                    "description": "Debemos de comprar comida para todo el mes",
                  },
                ).then((DocumentReference value) {
                  print(value.id);
                }).catchError((error) {
                  print("Ocurrio un error en el registro");
                }).whenComplete(() {
                  print("El registro a terminado");
                });
              },
              child: Text(
                "Agregar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("jooBz3FRwcvHS1yc5r3K").update(
                  {
                    "title": "Ir de paseo al campo",
                  },
                ).catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print("Actualizacion terminada");
                  },
                );
              },
              child: Text(
                "Actualizar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("G31E2UdBTv7Jtb5PaNzF").delete().catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print("La eliminación esta completa");
                  },
                );
              },
              child: Text(
                "Eliminar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("A00002").set(
                  {
                    "title": "Ir al concierto",
                    "description":
                        "Este fin de semana debemos de ir al concierto",
                  },
                ).catchError((error) {
                  print(error);
                }).whenComplete(() {
                  print("Creación completa");
                });
              },
              child: Text(
                "Agregar documento personalizado",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
