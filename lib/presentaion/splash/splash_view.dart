import 'package:flutter/material.dart';
import 'package:nabi_app/presentaion/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String path = "/";
  static const String name = "SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<SplashViewModel>().autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("스플래시"),
      ),
    );
  }
}
