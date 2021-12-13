import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:turbo_taxi/src/core/core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  late FirebaseAuth _firebaseAuth;
  late DatabaseReference _userRef;

  @override
  void initState() {
    _firebaseAuth = FirebaseAuth.instance;
    _userRef = FirebaseDatabase.instance.reference().child('users');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 45.0,
              ),
              Align(
                child: Image.asset(
                  AssetConsts.logo,
                  height: 250.0,
                  width: 350.0,
                ),
                alignment: Alignment.topCenter,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                AppConst.login_as_rider,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FormBuilderTextField(
                name: 'email',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.email(context),
                  FormBuilderValidators.maxLength(context, 40),
                ]),
                controller: _emailTextEditingController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontWeight: FontWeight.w600),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColor.lightGrey,
                      ),
                ),
              ),
              FormBuilderTextField(
                name: 'password',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.minLength(context, 6),
                ]),
                controller: _passwordTextEditingController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontWeight: FontWeight.w600),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColor.lightGrey,
                      ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.goldDeep,
                  fixedSize: Size(300, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () async {
                  _formKey.currentState?.save();
                  if (_formKey.currentState!.validate()) {
                    await loginUser(context);
                  }
                },
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteConsts.signup);
                  },
                  child: Text(
                    'Do not have an account? Register here',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    showCustomDialog(context, 'Logging in...');
    _formKey.currentState?.save();
    final firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: _emailTextEditingController.text,
                password: _passwordTextEditingController.text)
            .catchError(
      (error) {
        Navigator.pop(context);
        Utils.displayToastMessage('Error: ${error.toString()}');
      },
    ))
        .user;
    if (firebaseUser != null) {
      _userRef.child(firebaseUser.uid).once().then((DataSnapshot snapshot) {
        if (snapshot.value != null) {
          Navigator.pushReplacementNamed(context, RouteConsts.home);
          Utils.displayToastMessage('Login Successful.');
        } else {
          _firebaseAuth.signOut();
          Utils.displayToastMessage('No record exists for this user.');
        }
      });
    } else {
      Navigator.pop(context);
      Utils.displayToastMessage('Login Failed.');
    }
  }
}
