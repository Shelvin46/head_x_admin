import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_widgets.dart';

class FirstContainer extends StatelessWidget {
  const FirstContainer({super.key});

  // get() async {
  //   final doc = FirebaseFirestore.instance.collection('products').doc();
  //   FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider());
  // }

  @override
  Widget build(BuildContext context) {
    // get();
    return Container(
      width: double.infinity,
      height: 150,
      // color: Colors.amber,
      child: Row(
        children: [
          Padding(
            padding: addGap2,
            child: SizedBox(
              height: 150,
              width: 130,
              // color: Colors.amberAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+",
                    style: addText2,
                  ),
                  Text("Add Photos", style: addText3)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
