import 'package:flutter/material.dart';
import 'package:nabi_app/router/router_config.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

OverlayEntry? _entry;

void showLoadingBar() {
  if (rootContext == null) return;

  final overlayState = Overlay.of(rootContext!);

  _entry = OverlayEntry(
    builder: (_) => Material(
      color: color1F1F1F.withOpacity(0.2),
      child: const Center(
        child: CircularProgressIndicator(
          color: color233067,
        ),
      ),
    ),
  );

  overlayState.insert(_entry!);
}

void dismissLoadingBar() {
  _entry?.remove();
  _entry = null;
}