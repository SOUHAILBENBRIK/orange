import 'package:flutter/material.dart';
import 'package:todolist/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Login Page"),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.sizeOf(context).height,
        child: Center(
            child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Center(
              child: Image.asset("assets/orange.png"),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.deepOrange),
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Image.asset("assets/google.png")),
                    Spacer(),
                    Text(
                      "Sign in with Google",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        )),
      ),
    );
  }
}
