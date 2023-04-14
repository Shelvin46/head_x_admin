import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUpdate {
  Future updateProduct({
    required List<String> images,
    required String name,
    required String type,
    required String color,
    required int length,
    required int price,
    required String id,
    required int index,
  }) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('category').doc(id).get();
    List<dynamic> products = documentSnapshot.get('product');

    products[index] = {
      'name': name,
      'description': type,
      'color': color,
      'images': images,
      'lenght': length,
      'price': price,
      'id': id,
    };
    FirebaseFirestore.instance.collection('category').doc(id).update({
      'product': products,
    });
  }
}
