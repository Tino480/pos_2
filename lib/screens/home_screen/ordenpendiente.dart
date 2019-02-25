import 'package:flutter/material.dart';
import 'package:pos/screens/myclipper.dart';
import 'package:pos/screens/current_orders/current_order_builder.dart';

class OrdenPendiente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 130.0,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/pizza.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Ordenes",
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CurrentOrder(),
            ),
          ],
        ),
      ),
    );
  }
}
