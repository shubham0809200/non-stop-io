import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_stop_io/core/route_constants.dart';
import 'package:non_stop_io/ui/widgets/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1E0220),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                height: 322,
                width: 322,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text('Sign in with',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFE5E5E5),
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  signInButton(
                    context,
                    'Google',
                    'assets/images/google.png',
                    Colors.white,
                    Colors.black,
                    () {
                      context.pushReplacementNamed(RouteName.homeScreen);
                    },
                  ),
                  const SizedBox(height: 20),
                  signInButton(
                    context,
                    'Facebook',
                    'assets/images/facebook.png',
                    const Color(0xFF3D6AD6),
                    Colors.white,
                    () {
                      context.pushReplacementNamed(RouteName.homeScreen);
                    },
                  ),
                  const SizedBox(height: 20),
                  signInButton(
                    context,
                    'LinkedIn',
                    'assets/images/linkedin.png',
                    const Color(0xFF0077B5),
                    Colors.white,
                    () {
                      context.pushReplacementNamed(RouteName.homeScreen);
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
