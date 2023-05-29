import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  Future addProduct(
      {required List<String> images,
      required String name,
      required String type,
      required String color,
      required int length,
      required int price,
      required String id,
      required int quantity}) async {
    FirebaseFirestore.instance.collection('category').doc(id).update({
      'product': FieldValue.arrayUnion([
        {
          'name': name,
          'description': type,
          'color': color,
          'images': images,
          'lenght': length,
          'price': price,
          'id': id,
          'quantity': quantity
        }
      ])
    });
  }

  // Future addWirelessHeadphones({
  //   required List<String> images,
  //   required String name,
  //   required String type,
  //   required String color,
  //   required int length,
  //   required int price,
  //   required int quandity,

  // }) async {
  //   FirebaseFirestore.instance
  //       .collection('category')
  //       .doc('Hk1u1J5zJtV0SznPROqY')
  //       .update({
  //     'wirelessProducts': FieldValue.arrayUnion([
  //       {
  //         'name': name,
  //         'type': type,
  //         'color': color,
  //         'images': images,
  //         'lenght': length,
  //         'price': price,
  //         'quandity': quandity
  //       }
  //     ])
  //   });
  // }
}
