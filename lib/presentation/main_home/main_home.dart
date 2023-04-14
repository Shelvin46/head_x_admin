import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/presentation/categories/wired_headphones/main_wired.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "All Categories",
            style: mainSection,
          ),
          backgroundColor: appbarColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
            ),
          ]),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                  stream: getproducts,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data != []) {
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns in the grid
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 8,
                          ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, index) {
                            final document = snapshot.data[index];

                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 80,
                                  backgroundColor: const Color(0xFFCFE0E1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return MainWiredHeadphones(
                                                  title: document['name'],
                                                  id: document['id'],
                                                  
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                            width: 100,
                                            height: 110,
                                            child: Image(
                                              image: NetworkImage(
                                                  document['image']),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(document['name']),
                              ],
                            );
                          });
                    }

                    return const Text("shfjkshfjw");
                  }),
            ),
          )
        ],
      ),
    );
  }

  Stream getproducts = (() async* {
    final QuerySnapshot<Map<String, dynamic>> usersStream =
        await FirebaseFirestore.instance.collection('category').get();

    List productlist = usersStream.docs.map((e) => e.data()).toList();

    yield productlist;
    // log(productlist.toString());
  })();
}
