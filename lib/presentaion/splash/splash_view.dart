import 'package:flutter/material.dart';
import 'package:nabi_app/presentaion/login/login_view.dart';
import 'package:nabi_app/presentaion/splash/splash_view_model.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String name = "splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _splashAction();
  }

  void _splashAction() {
    context.read<SplashViewModel>().splashAction().then(
      (value) {
        context.goNamed(LoginView.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("스플래시"),
      ),
    );
  }
}
