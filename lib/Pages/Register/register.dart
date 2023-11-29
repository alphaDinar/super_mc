import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_mc/Firebase/firebaseAuthService.dart';

final _formKey = GlobalKey<FormState>();
final _formKey2 = GlobalKey<FormState>();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;

  final FirebaseAuthService _fireAuth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  // final List _pages = ['1', '2'];

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

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
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                'Already have an account? Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
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
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40)),
              child: TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter A Username";
                  }
                  return null;
                },
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Username',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(40)),
              child: TextFormField(
                controller: _phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 9) {
                    return "Enter A Valid Phone Number";
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
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter password";
                  }
                  return null;
                },
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
                  // if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    Navigator.pushNamed(context, '/stores');
                    // loginUser();
                  // }
                  // Navigator.pushNamed(context, '/stores');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: _isLoading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).cardColor,
                        )
                      : Text(
                          'Register',
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
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              fontFamily: GoogleFonts.signikaNegative().fontFamily),
        ),
        Text(
          'Haven for food enthusiasts.',
        )
      ],
    );
  }

  void loginUser() async {
    print('king Kong');

    User? user = await _fireAuth.sendOtp(
        phone: _phoneController.text,
        errorStep: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Error",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        },
        nextStep: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Column(
                      children: [
                        Form(
                            key: _formKey2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: _otpController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(hintText: 'OTP'),
                                  validator: (value) {
                                    if (value == null || value.length < 6) {
                                      return 'invalid otp';
                                    }
                                    return null;
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey2.currentState!.validate()) {
                                      print('otp');
                                      _fireAuth
                                          .loginWithOtp(
                                              otp: _otpController.text)
                                          .then((value) {
                                        if (value == 'success') {
                                          Navigator.pop(context);
                                          Navigator.pushNamed(context, '/stores');
                                        } else {
                                          print(value);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('My first snackbar'),
                                            duration: Duration(seconds: 1),
                                            backgroundColor: Colors.red,
                                          ));
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ));
        });
  }
}
