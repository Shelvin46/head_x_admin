import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/presentation/categories/wired_headphones/main_wired.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

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
              padding: EdgeInsets.only(right: 14),
              child: InkWell(
                onTap: () {
                  //  Navigator.push(context,)
                },
                child: Icon(
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
              child: GridView.count(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 30,
                crossAxisSpacing: 8,
                children: List.generate(6, (index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Color(0xFFCFE0E1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return MainWiredHeadphones();
                                  },
                                ));
                              },
                              child: Container(
                                width: 100,
                                height: 110,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text("Wired Headphones")
                    ],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
