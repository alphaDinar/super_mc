import 'package:flutter/material.dart';

final _formKey = GlobalKey();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.redAccent,
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      // padding: EdgeInsets.symmetric(vertical: 200),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: [
            Container(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 300,),
                  formHeader(),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Column(
                      children: [
                        formBox(context),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                "Don't have an account yet'? Register",
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(40)),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Form formBox(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [           
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(40)),
              child: TextFormField(
                controller: _phoneController,
                validator: (value) {
                  if (value == null || value.length < 9) {
                    return 'Enter Valid Number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Phone',
                    prefixText: '+233',
                    prefixStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40)),
              child: TextFormField(
                controller: _passwordController,
                // keyboardType: TextInputType.,
                style: TextStyle(fontSize: 15, decoration: TextDecoration.none),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
                child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            )),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/stores');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(40)),
                )),
          ],
        ));
  }

  Column formHeader() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          child: Image.asset('images/logo.png'),
        ),
        Text(
          'Super MC',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
        Text(
          'Haven for food enthusiasts.',
        )
      ],
    );
  }
}
