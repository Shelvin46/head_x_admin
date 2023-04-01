import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_widgets.dart';

import '../../main.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      required this.title,
      required this.appbarColor,
      });
  final String title;
  final Color appbarColor;
  //final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: appbarColor,
      child: Row(
       // crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: myMediaQueryData.size.width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(top: myMediaQueryData.size.height * 0.03),
            child: Text(
              title,
              style: loginSection,
            ),
          ),
         // Icon(icon)
        ],
      ),
    );
  }
}
