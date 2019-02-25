import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class orderBuilder extends StatelessWidget {
  const orderBuilder({this.documents});
  final List<DocumentSnapshot> documents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: documents.length,
        itemExtent: 200.0,
        itemBuilder: (BuildContext context, int index) {
          String Photo = documents[index].data['Photo'].toString();
          String Nombre = documents[index].data['Nombre'].toString();
          String Precio = documents[index].data['Precio'].toString();
          int Cantidad = documents[index].data['Cantidad'];

          void order() async {
            final FirebaseAuth _auth = FirebaseAuth.instance;
            final FirebaseUser user = await _auth.currentUser();
            final String uid = user.uid;
            Firestore.instance.runTransaction((transaction) async {
              await transaction.set(Firestore.instance.collection("Orders").document(uid), {

                  'user': uid,
                  'Items': [],

              });
            Firestore.instance.collection('Orders').document(uid).setData({
              'user': uid,
              'Items':FieldValue.arrayUnion([Nombre]),
              'Total':FieldValue.arrayUnion([Precio]),
              'Customer':FieldValue.arrayUnion([Cantidad]),
            },
            merge: true
            );
          };

          return Container(
            padding: const EdgeInsets.only(bottom: 0.8),
            height: 400.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.luminosity),
                      image: NetworkImage(Photo),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    height: 400.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Nombre,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.white),
                        ),
                        Text(
                          '$Precio',
                          style: const TextStyle(
                              fontSize: 30.0, color: Colors.white),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                color: Colors.white,
                                iconSize: 50.0,
                                icon: const Icon(Icons.arrow_left),
                                onPressed: () {
                                  Firestore.instance.runTransaction(
                                      (Transaction transaction) async {
                                    DocumentSnapshot snapshot =
                                        await transaction
                                            .get(documents[index].reference);
                                    if (Cantidad != 0)
                                      await transaction.update(
                                          snapshot.reference, {
                                        'Cantidad': snapshot['Cantidad'] - 1
                                      });
                                  });
                                },
                              ),
                              Text('$Cantidad',
                                  style: const TextStyle(
                                      fontSize: 30.0, color: Colors.white)),
                              IconButton(
                                color: Colors.white,
                                iconSize: 50.0,
                                icon: const Icon(Icons.arrow_right),
                                onPressed: () {
                                  Firestore.instance.runTransaction(
                                      (Transaction transaction) async {
                                    DocumentSnapshot snapshot =
                                        await transaction
                                            .get(documents[index].reference);
                                    await transaction.update(snapshot.reference,
                                        {'Cantidad': snapshot['Cantidad'] + 1});
                                  });
                                },
                              ),
                            ]),
                        Container(
                          width: 250.0,
                          decoration: const BoxDecoration(color: Colors.red),
                          child: ListTile(
                            title: Text(
                              'Agregar a la Orden',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                                color: Colors.white,
                                iconSize: 30.0,
                                icon: Icon(Icons.add_shopping_cart),
                                onPressed: order),
                          ),
                        ),
                        //new Container()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
