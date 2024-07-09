import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nabi_app/presentaion/main/components/main_view_components.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';

mixin FloatingMenuOverlayMixin<MainView extends StatefulWidget> on State<MainView> {
  OverlayEntry? _entry;

  @override
  void dispose() {
    disposeOverlay();
    super.dispose();
  }

  void showOverlay(
    BuildContext context, {
    required Widget child,
    required LayerLink link,
  }) {
    final overlayState = Overlay.of(context);

    _entry = OverlayEntry(
      builder: (_) => _buildOverlay(
        child: child,
        link: link,
      ),
    );

    overlayState.insert(_entry!);
  }

  void hideOverlay() {
    _entry?.remove();
  }

  void disposeOverlay() {
    _entry?.dispose();
  }

  Widget _buildOverlay({required Widget child, required LayerLink link}) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          GestureDetector(
            onTap: hideOverlay,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            width: 160.w,
            height: 104.w,
            child: CompositedTransformFollower(
              link: link,
              followerAnchor: Alignment.bottomRight,
              targetAnchor: Alignment.topRight,
              child: child,
            ),
          ),
          Positioned(
            width: 56.w,
            height: 56.w,
            child: CompositedTransformFollower(
              link: link,
              child: MainFloatingActionButton(
                color: Colors.white,
                child: Assets.svg.iconClose.svg(width: 24.w, height: 24.w),
                onPressed: () => hideOverlay(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
