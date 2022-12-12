import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/ui/general/colors.dart';
import 'package:tasks/ui/widgets/button_custom_widget.dart';
import 'package:tasks/ui/widgets/button_normal_widget.dart';
import 'package:tasks/ui/widgets/general.widgets.dart';
import 'package:tasks/ui/widgets/textfield_normal_widget.dart';
import 'package:tasks/ui/widgets/textfield_password_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              divider30(),
              SvgPicture.asset(
                'assets/images/login.svg',
                height: 180.0,
              ),
              divider30(),
              Text(
                "Iniciar Sesión",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrimaryColor,
                ),
              ),
              divider10(),
              TextFieldNormalWidget(
                hintText: "Correo Electronico",
                icon: Icons.email,
                controller: _emailController,
              ),
              divider10(),
              divider6(),
              TextFieldPasswordWidget(
                controller: _passwordController,
              ),
              divider20(),
              ButtonCustomWidget(
                text: "Iniciar Sesión",
                icon: "check1",
                color: kBrandPrimaryColor,
              ),
              divider20(),
              Text(
                "ó ingresa con tus redes sociales",
              ),
              divider20(),
              ButtonCustomWidget(
                text: "Iniciar sesion con Google",
                icon: "google1",
                color: Color(0xfff84b2a),
              ),
              divider20(),
              ButtonCustomWidget(
                text: "Facebook",
                icon: "facebook",
                color: Color(0xff507cc0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
