import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_stop_io/core/route_constants.dart';
import 'package:non_stop_io/ui/widgets/sign_in_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBackgroundBody(context),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  _buildBackgroundBody(BuildContext context) {
    return Stack(children: [
      Container(
        height: 320,
        decoration: const BoxDecoration(
          color: Color(0xFF1E0220),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
    ]);
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 60),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
        const SizedBox(height: 80),
        Center(
          child: Container(
            height: 250,
            width: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _inputFields(context, 'Name', 'John Doe'),
        const SizedBox(height: 10),
        _inputFields(context, 'Email Id', 'johndeo@email.com'),
        const SizedBox(height: 70),
        Center(
            child: signInButton(context, 'Logout', '', Colors.red, Colors.white,
                () {
          context.pushReplacementNamed(RouteName.loginScreen);
        })),
        const SizedBox(height: 20),
      ],
    );
  }

  Center _inputFields(BuildContext context, String title, String value) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF979797),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: 75,
            child: TextField(
              style: const TextStyle(color: Colors.red),
              decoration: InputDecoration(
                hintText: value,
                fillColor: const Color(0xFFEEEEEE),
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
