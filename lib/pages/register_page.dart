import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/ui/general/colors.dart';
import 'package:tasks/ui/widgets/button_custom_widget.dart';
import 'package:tasks/ui/widgets/general.widgets.dart';
import 'package:tasks/ui/widgets/textfield_normal_widget.dart';
import 'package:tasks/ui/widgets/textfield_password_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              divider30(),
              SvgPicture.asset(
                'assets/images/login.svg',
                height: 180.0,
              ),
              divider30(),
              Text(
                "Registrate",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrimaryColor,
                ),
              ),
              divider20(),
              TextFieldNormalWidget(
                hintText: "Nombre completo",
                icon: Icons.email,
                controller: _fullNameController,
              ),
              divider10(),
              divider6(),
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
                text: "Registrate ahora",
                icon: "check1",
                color: kBrandPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}