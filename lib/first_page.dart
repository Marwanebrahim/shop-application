import 'package:flutter/material.dart';
import 'package:shop/sign%20option/sign_in.dart';
import 'package:shop/sign%20option/sign_up.dart';
import 'package:easy_localization/easy_localization.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool hiddenpass = true, b = false;
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController ocnfirmpass = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent, elevation: 0,
          actions: [
            IconButton(onPressed: () {
              changelang();
            }, icon: Icon(Icons.language ,size: 30,),
            )
          ],
        ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr("first page1"),
                  style: TextStyle(fontSize: 55, color: Colors.white),
                ),
                Text(
                  tr("first page2"),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 20),
                Container(
                  width: 320,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(2, 4),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("assets/i1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 320,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(2, 4),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("assets/i2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(90, 50),
                      ),
                      child: Text(tr("first page3")),
                    ),
                    SizedBox(width: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(90, 50),
                      ),
                      child: Text(tr("first page4")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
     
  }
   changelang() {
    if (context.locale == Locale('ar', 'EG')) {
      context.setLocale(Locale('en', 'US'));
    } else {
      context.setLocale(Locale('ar', 'EG'));
    }
  }
}
