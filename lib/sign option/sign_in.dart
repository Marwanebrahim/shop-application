import 'package:flutter/material.dart';
import 'package:shop/homepage.dart';
import 'package:easy_localization/easy_localization.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hiddenpass = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 2, 104, 187),
              const Color.fromARGB(208, 180, 4, 211),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr("sign in1"),
                    style: TextStyle(color: Colors.purple, fontSize: 35),
                  ),
                  Text(tr("sign in2")),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: tr("sign in3"),
                              border: OutlineInputBorder(),
                              errorStyle: TextStyle(color: Colors.red),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return tr("sign in4");
                              }

                              if (value != null && !value.contains('@')) {
                                return tr("sign in5");
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            controller: password,
                            obscureText: hiddenpass,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              labelText: tr("sign in6"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  tooglepassword();
                                },
                                icon: Icon(
                                  hiddenpass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              errorStyle: TextStyle(color: Colors.red),
                            ),

                            validator: (value) {
                              if (value != null && value.length < 6) {
                                return tr("sign in7");
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Welcome!",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          255,
                                          52,
                                          197,
                                          57,
                                        ),
                                      ),
                                    ),
                                    content: Text(
                                      "Account sign-in successfully",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          255,
                                          121,
                                          121,
                                          121,
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(),
                                            ),
                                          );
                                        },
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "close",
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                255,
                                                52,
                                                197,
                                                57,
                                              ),fontSize: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.orange.shade100,
                                  behavior: SnackBarBehavior.floating,
                                  content: Row(
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          tr("sign in8"),
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(tr("sign in9")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  tooglepassword() {
    hiddenpass = !hiddenpass;
    setState(() {});
  }
}
