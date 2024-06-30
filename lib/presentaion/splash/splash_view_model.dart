import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel extends ChangeNotifier {
  Future<void> splashAction() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}