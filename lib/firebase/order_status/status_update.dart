// import 'dart:ffi';/

import 'package:cloud_firestore/cloud_firestore.dart';

class StatusUpdate {
  Future<void> update(String user, int index, String status) async {
    final docData =
        await FirebaseFirestore.instance.collection('users').doc(user).get();
    List<dynamic> orders = docData.data()?['orders'] ?? [];
 if (index >= 0 && index < orders.length) {
      Map<String, dynamic> data = orders[index];
      data['status'] = status;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .update({'orders': orders});
    }
  }
}
