import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nabi_app/data/notification/local_notification.dart';
import 'package:nabi_app/presentaion/diary/diary_write_view.dart';
import 'package:nabi_app/presentaion/goal/goal_write_view.dart';
import 'package:nabi_app/presentaion/main/components/floating_menu_overlay_mixin.dart';
import 'package:nabi_app/presentaion/main/components/main_view_components.dart';
import 'package:nabi_app/presentaion/my/my_view.dart';
import 'package:nabi_app/user/auth_provider.dart';
import 'package:nabi_app/utils/permission_request.dart';
import 'package:nabi_app/utils/ui/assets.gen.dart';
import 'package:nabi_app/utils/ui/ui_theme.dart';
import 'package:provider/provider.dart';

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

  String get _titleText => switch(widget.navigationShell.currentIndex) {
    0 => "나의 목표",
    1 => "일기",
    2 => "나비 컬렉션",
    _ => "음악추천",
  };

  @override
  void initState() {
    super.initState();
    requestNotificationPermission();
    initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: colorEBEDF5,
      body: widget.navigationShell,
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 84.w,
      titleSpacing: 0,
      forceMaterialTransparency: true,
      title: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 30.w, 16.w, 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitle(),
            _buildProfile(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      _titleText,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
        height: 1.125,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    final imageUrl = context.read<AuthProvider>().userInfo!.profileImage;

    return GestureDetector(
      onTap: () => context.pushNamed(MyView.name),
      child: Container(
        height: 44.w,
        width: 44.w,
        decoration: BoxDecoration(
          color: Colors.pink,
          shape: BoxShape.circle,
          image: imageUrl?.isEmpty ?? true
              ? null
              : DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget? _buildFloatingActionButton() {
    if (widget.navigationShell.currentIndex == 2) {
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
                onTap: () {
                  hideOverlay();
                  context.pushNamed(DiaryWriteView.name);
                },
              ),
              MainPopupMenuItem(
                title: "목표 추가",
                onTap: () {
                  hideOverlay();
                  context.pushNamed(GoalWriteView.name);
                },
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
            _buildBottomNavigationBarItem(
              onTap: () => widget.navigationShell.goBranch(2),
              isSelected: widget.navigationShell.currentIndex == 2,
            ),
            _buildBottomNavigationBarItem(
              onTap: () => widget.navigationShell.goBranch(3),
              isSelected: widget.navigationShell.currentIndex == 3,
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
