import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/presentation/main_home/main_home.dart';
import 'package:head_x_admin/presentation/widgets/app_bar.dart';
import '../../core/ui_widgets.dart';
import '../../main.dart';

class MainLoginPage extends StatelessWidget {
  const MainLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            title: "Welcome",
            appbarColor: appbarColor,
          )),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          loginPageGap1,
          Container(
            width: myMediaQueryData.size.width * 0.5,
            height: myMediaQueryData.size.height * 0.27,
            decoration: loginContainer,
          ),
          loginPageGap2,
          Container(
            height: myMediaQueryData.size.height * 0.07,
            width: myMediaQueryData.size.height * 0.4,
            decoration: textformRadius,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "  Admin id",
                  labelStyle: labelColor),
            ),
          ),
          loginPageGap2,
          Container(
            height: myMediaQueryData.size.height * 0.07,
            width: myMediaQueryData.size.height * 0.4,
            decoration: textformRadius,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "  Password",
                  labelStyle: labelColor),
            ),
          ),
          loginPageGap3,
          Padding(
            padding: EdgeInsets.only(left: myMediaQueryData.size.width * 0.4),
            child: fPassword,
          ),
          loginPageGap4,
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MainHome();
                },

              ));
              
            },
            child: Padding(
              padding:
                  EdgeInsets.only(left: myMediaQueryData.size.width * 0.03),
              child: submitButton,
            ),
          ),
        ]),
      ),
    );
  }
}
