import 'package:flutter/material.dart';
import 'package:turbo_taxi/src/core/core.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            TextFormField(
              style: Theme.of(context).textTheme.bodyText2,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColor.lightGrey,
                    ),
              ),
            ),
            TextFormField(
              style: Theme.of(context).textTheme.bodyText2,
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
              onPressed: () {},
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
    );
  }
}
