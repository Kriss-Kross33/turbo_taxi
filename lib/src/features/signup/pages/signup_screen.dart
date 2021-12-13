import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:turbo_taxi/src/core/core.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _phoneNumberTextEditingController =
      TextEditingController();

  late FirebaseAuth _firebaseAuth;
  late DatabaseReference userRef;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    _firebaseAuth = FirebaseAuth.instance;
    userRef = FirebaseDatabase.instance.reference().child('users');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                AppConst.signup_as_rider,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FormBuilderTextField(
                name: 'full_name',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.minLength(context, 3),
                ]),
                controller: _nameTextEditingController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontWeight: FontWeight.w600),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Full name',
                  labelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColor.lightGrey,
                      ),
                ),
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
                name: 'phone_number',
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  // FormBuilderValidators.max(context, 10),
                  FormBuilderValidators.numeric(context),
                ]),
                controller: _phoneNumberTextEditingController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontWeight: FontWeight.w600),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone number',
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
                    await registerNewUser(context);
                  }
                },
                child: Text(
                  'Create account',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteConsts.login);
                  },
                  child: Text(
                    'Already have an account? Login here',
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

  Future<void> registerNewUser(BuildContext context) async {
    showCustomDialog(context, 'Creating Turbo Taxi account...');
    final _firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
      email: _emailTextEditingController.text,
      password: _passwordTextEditingController.text,
    )
            .catchError(
      (error) {
        Navigator.pop(context);
        Utils.displayToastMessage('Error: ${error.toString()}');
      },
    ))
        .user;
    // User created
    if (_firebaseUser != null) {
      // Save user to database
      Map<String, dynamic> userDataMap = {
        "name": _nameTextEditingController.text.trim(),
        "email": _emailTextEditingController.text.trim(),
        "phone": _phoneNumberTextEditingController.text.trim(),
      };
      userRef.child(_firebaseUser.uid).set(userDataMap);
      Utils.displayToastMessage('Account created successfully');
      Navigator.pushReplacementNamed(context, RouteConsts.home);
    } else {
      Navigator.pop(context);
      // Error occured - Display error message.
      Utils.displayToastMessage('User account has not been created');
    }
  }
}
