import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/presentaion/main/components/floating_menu_overlay_mixin.dart';
import 'package:nabi_app/presentaion/main/components/main_view_components.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';

class MainView extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainView({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with FloatingMenuOverlayMixin {
  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      backgroundColor: colorEBEDF5,
      body: widget.navigationShell,
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget? _buildFloatingActionButton() {
    if (widget.navigationShell.currentIndex != 0 && widget.navigationShell.currentIndex != 1) {
      return null;
    }

    return CompositedTransformTarget(
      link: _layerLink,
      child: MainFloatingActionButton(
        color: color233067,
        child: Assets.svg.iconAdd.svg(width: 24.w, height: 24.w),
        onPressed: () => showOverlay(
          context,
          link: _layerLink,
          child: MainPopupMenu(
            items: [
              MainPopupMenuItem(
                title: "일기 쓰기",
                onTap: () {},
              ),
              MainPopupMenuItem(
                title: "목표 추가",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      color: Colors.white,
      padding: EdgeInsets.zero,
      elevation: 0,
      height: 56.w,
      notchMargin: 0,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: colorEBEDF5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBottomNavigationBarItem(
              onTap: () => widget.navigationShell.goBranch(0),
              isSelected: widget.navigationShell.currentIndex == 0,
            ),
            _buildBottomNavigationBarItem(
              onTap: () => widget.navigationShell.goBranch(1),
              isSelected: widget.navigationShell.currentIndex == 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBarItem({
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Icon(Icons.circle),
      ),
    );
  }
}
