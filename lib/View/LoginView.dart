import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    userName.text = "Username";
    TextEditingController password = TextEditingController();
    password.text = "password";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: const EdgeInsets.all(30),
            child: Center(
              child: Card(
                elevation: 12,
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 36
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: userName,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: password,
                        obscureText: true,
                      ),
                    ),
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        OutlinedButton(onPressed: (){
                          Navigator.pushNamed(context, '/agency_listveiw');
                        }, child: const Text("login")),
                        OutlinedButton(onPressed: (){}, child: const Text("Sign Up"))
                      ]
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
