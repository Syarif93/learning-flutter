import 'package:flutter/material.dart';

class LearnTextField extends StatefulWidget {
  const LearnTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<LearnTextField> createState() => _LearnTextFieldState();
}

class _LearnTextFieldState extends State<LearnTextField> {
  // Toggle show password
  bool isHidden = true;

  // Controller inputs
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Text Field"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: email,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: password,
            autocorrect: false,
            obscureText: isHidden,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              labelText: "Password",
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                onPressed: () {
                  isHidden = !isHidden;
                  setState(() {});
                },
                icon: const Icon(Icons.remove_red_eye),
              ),
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("Login email: ${email.text}, password: ${password.text}");
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red[900],
              padding: const EdgeInsets.symmetric(horizontal: 30),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            child: const Text("Login"),
          )
        ],
      ),
    );
  }
}
