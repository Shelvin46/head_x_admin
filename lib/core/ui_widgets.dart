import 'package:flutter/material.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/main.dart';

TextStyle loginSection = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  // fontStyle: FontStyle.italic,
  fontSize: 28,
);
SizedBox loginPageGap1 = SizedBox(
  height: myMediaQueryData.size.height * 0.1,
  width: myMediaQueryData.size.width * 10,
);
SizedBox loginPageGap2 = SizedBox(
  height: myMediaQueryData.size.height * 0.03,
);

BoxDecoration loginContainer = const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        "assets/logo.png",
      ),
      fit: BoxFit.fill,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)));
BoxDecoration textformRadius = BoxDecoration(
    color: Color.fromARGB(255, 155, 173, 171),
    borderRadius: const BorderRadius.all(Radius.circular(8)));
SizedBox loginPageGap3 = SizedBox(
  height: myMediaQueryData.size.height * 0.02,
);
Text fPassword = const Text(
  "Forgot Password?",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
);
SizedBox loginPageGap4 = SizedBox(
  height: myMediaQueryData.size.height * 0.05,
);
Text submitButton = const Text(
  "Login",
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
);
Text createAcc = const Text(
  "Dont havean account ?",
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,

    // color: Colors.blue,
  ),
);
Text createButton = const Text(
  "Create",
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
);
//<----------------------------------------------------------------------------Login--------------------------------------------------------------------------------------------------->
TextStyle mainSection = const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  // fontStyle: FontStyle.italic,
  fontSize: 28,
);
SizedBox listGap1 = SizedBox(
  height: 10,
);
SizedBox listGap2 = SizedBox(
  width: 10,
);
SizedBox listGap3 = SizedBox(
  height: 25,
);
TextStyle productName = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
SizedBox listGap4 = SizedBox(
  height: 50,
  //width: 200,
);
//<--------------------------------------------------------------------------------wiredHeadphones----------------------------------------------------------------------------------------->
SizedBox addGap1 = SizedBox(
  height: 10,
);
EdgeInsets addGap2 = const EdgeInsets.only(left: 15);
TextStyle addText1 = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
TextStyle addText2 = TextStyle(fontSize: 40, color: appbarColor);
TextStyle addText3 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
SizedBox addGap3 = SizedBox(
  width: 20,
);
TextStyle addText4 = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
//<--------------------------------------------------------------------------------Add Product----------------------------------------------------------------------------------------------->

SizedBox detailGap = SizedBox(
  height: 16,
);
TextStyle detailText1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
TextStyle detailText2 = TextStyle(fontWeight: FontWeight.bold, fontSize: 28);
TextStyle detailText3 = TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
SizedBox detailGap2 = SizedBox(
  height: myMediaQueryData.size.height * 0.01,
);
//<-------------------------------------------------------------------------------Product Detail=-------------------------------------------------------------------------------------------->
SizedBox editGap1 = SizedBox(
  height: 7,
);
EdgeInsets editGap2 = EdgeInsets.only(left: 10);
TextStyle editText1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
SizedBox editGap3 = SizedBox(
  height: 10,
);
TextStyle editText2 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24,
);
SizedBox editGap4 = SizedBox(
  height: 15,
);
TextStyle editText3 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
);
//<--------------------------------------------------------------------------------Edit Details---------------------------------------------------------------------------------------------->