import 'package:agencyui/View/AgencyListView.dart';
import 'package:agencyui/View/MainView.dart';
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
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(40),
          child: Card(
            elevation: 12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    OutlinedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute<void>(
                                     builder: (BuildContext context) => const MainView(),
                                   ),);
                    }, child: const Text("login")),
                    OutlinedButton(onPressed: (){}, child: const Text("Sign Up"))
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
