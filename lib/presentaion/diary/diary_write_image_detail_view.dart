import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiaryWriteImageDetailView extends StatefulWidget {
  final ({List<File> images, int index}) args;

  const DiaryWriteImageDetailView({super.key, required this.args});

  static const String path = "images";
  static const String name = "DiaryWriteImageDetailView";

  @override
  State<DiaryWriteImageDetailView> createState() => _DiaryWriteImageDetailViewState();
}

class _DiaryWriteImageDetailViewState extends State<DiaryWriteImageDetailView> {
  List<File> get images => widget.args.images;
  late int _page;
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _page = widget.args.index + 1;
    _controller = PageController(initialPage: widget.args.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: images.length,
                      onPageChanged: (page) {
                        _page = page + 1;
                        setState(() {});
                      },
                      itemBuilder: (_, index) => Image.file(
                        images[index],
                      ),
                    ),
                  ),
                  Container(
                    width: 39.w,
                    height: 22.w,
                    margin: EdgeInsets.only(bottom: 100.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "$_page/${images.length}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        height: 1,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
