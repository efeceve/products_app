import 'package:flutter/material.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
                child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                _LoginForm(),
              ],
            )),
            SizedBox(
              height: 50,
            ),
            Text(
              'Create an Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.perez@mail.com',
                  labelText: 'Mail',
                  prefixIcon: Icons.alternate_email_sharp),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Mail is not valid';
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '******',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline),
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'Password must be, at least, 6 characters long';
              },
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
