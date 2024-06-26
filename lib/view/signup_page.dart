import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/custom_style.dart';
import '../funcs/firebase_funcs.dart';
import 'images_page.dart';
import '../widgets/loader_widget.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  bool checkBoxVal = false;


  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: false,onPopInvoked: (didPop) {
      showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "You are about to exit",
                    style: CustomStyle().getCStyle(size: 20),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          "exit",
                          style: CustomStyle().getCStyle(),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("no", style: CustomStyle().getCStyle()),
                    )
                  ],
                ));
    },
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Text("Coinone",
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 27))),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 35)),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: TextField(
                  controller: textEditingControllerEmail,
                  decoration: InputDecoration(
                      hintText: "email",
                      hintStyle: CustomStyle().getCStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: TextField(
                  controller: textEditingControllerPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "password",
                      hintStyle: CustomStyle().getCStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Keep me signed in"),
                  Checkbox(
                    value: checkBoxVal,
                    onChanged: (val) {
                      checkBoxVal = val ?? false;
                      FirebaseFuncs().keepLoggedInFunc(val: val ?? false);
                      setState(() {
                        
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 0),
              ElevatedButton(
                onPressed: () async {
                  showDialog(
                      context: context, builder: (context) => const LoaderWidget());
                  String reason = await FirebaseFuncs().createUser(
                      emailAddress: textEditingControllerEmail.text,
                      password: textEditingControllerPassword.text);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  if (context.mounted) {
                    reason == "logged in"
                        ? Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const ImagesPage()))
                        : Fluttertoast.showToast(msg: reason);
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.black87),
                    fixedSize:
                        WidgetStateProperty.all<Size>(const Size(200, 50))),
                child: Text(
                  "sign up",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage())),
                child: Text(
                  "Already signed up? Login..",
                  style: GoogleFonts.poppins(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
