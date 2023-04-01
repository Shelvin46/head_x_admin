import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/core/ui_widgets.dart';
import 'package:head_x_admin/presentation/adding_products/main_adding.dart';
import 'package:head_x_admin/presentation/product_detail/product_detail.dart';
//import 'package:head_x_admin/presentation/editing_products/main_editing.dart';
// import 'package:head_x_admin/presentation/product_detail/product_detail.dart';

import 'package:head_x_admin/presentation/widgets/app_bar.dart';

class MainWiredHeadphones extends StatelessWidget {
  const MainWiredHeadphones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child:
              AppBarWidget(title: "Wired Headphones", appbarColor: appbarColor),
          preferredSize: Size.fromHeight(50)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(67, 171, 163, 163),
        child: Column(
          children: [
            listGap1,
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProductDetail();
                          },
                        ));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.white,
                        child: Row(
                          children: [
                            listGap2,
                            Container(
                              height: 160,
                              width: 150,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/4.jpeg"))),
                            ),
                            listGap2,
                            Column(
                              children: [
                                listGap3,
                                Text(
                                  "boAt Bassheads 100 \nWired Headset\n(Black, In the Ear)",
                                  style: productName,
                                ),
                                listGap4,
                                Padding(
                                  padding: EdgeInsets.only(left: 160),
                                  child: Icon(
                                    Icons.delete,
                                    size: 40,
                                    color: appbarColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return listGap1;
                  },
                  itemCount: 7),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return MainAddingProduct();
            },
          ));
        },
        child: Icon(Icons.add),
        backgroundColor: appbarColor,
      ),
    );
  }
}
