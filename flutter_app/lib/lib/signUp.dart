// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomForm(),
    );
  }
}

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
final _emailController = TextEditingController();

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),

          // [Name]
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _usernameController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          //[Password]
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _passwordController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 12.0,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Confirm Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 12.0,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Email Address',
            ),
          ),
          // TODO: Add button bar (101)
          ButtonBar(
            // TODO: Add a beveled rectangular border to CANCEL (103)

            children: <Widget>[
              RaisedButton(
                child: Text('Sign Up'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
