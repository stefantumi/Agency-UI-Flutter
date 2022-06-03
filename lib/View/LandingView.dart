import 'package:flutter/material.dart';



class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return SizedBox(
      height: 400,
      width: 300,
      child: Card(
        child: Column(
          children:  [
            const ListTile(
              title: Text("Login"),
              contentPadding: EdgeInsets.all(16),
            ),
            const Text('Login window'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                restorationId: 'userId',
                textAlign: TextAlign.center,
                controller: username,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: password,
                obscureText: true,
              ),
            ),
            OutlinedButton(onPressed: (){
              Navigator.popAndPushNamed(context, '/agency_listview');
            }, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
