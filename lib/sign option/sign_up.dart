import 'package:flutter/material.dart';
import 'package:shop/homepage.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hiddenpass = true;
  bool hiddenpass2 = true;
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
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
            height: 600,
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
                    tr("sign up1"),
                    style: TextStyle(color: Colors.purple, fontSize: 35),
                  ),
                  Text(tr("sign up2")),

                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                             controller: fullname,
                            decoration: InputDecoration(
                              labelText: tr("sign up3"),
                              border: OutlineInputBorder(),
                              errorStyle: TextStyle(color: Colors.red),
                            ),
                            validator: (value) {
                               if (value != null && value.isEmpty) {
                                return tr("sign up4");
                               }
                               return null;
                            },

                          ),
                          ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: tr("sign up5"),
                              border: OutlineInputBorder(),
                              errorStyle: TextStyle(color: Colors.red),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return tr("sign up6");
                              }

                              if (value != null && !value.contains('@')) {
                                return tr("sign up7");
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            controller: password,
                            obscureText: hiddenpass,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              labelText: tr("sign up8"),
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
                                return tr("sign up9");
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                         Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            controller: confirmpass,
                            obscureText: hiddenpass2,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              labelText: tr("sign up10"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  tooglepassword2();
                                },
                                icon: Icon(
                                  hiddenpass2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: OutlineInputBorder(),
                              errorStyle: TextStyle(color: Colors.red),
                            ),

                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return tr("sign up9");
                              }
                              if(value !=password.text){
                                return tr("sign up11");
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
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
                                              ),fontSize: 20,
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
                                         tr("sign up12"),
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
                          child: Text(tr("sign up13")),
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
  tooglepassword2() {
    hiddenpass2 = !hiddenpass2;
    setState(() {});
  }
}
