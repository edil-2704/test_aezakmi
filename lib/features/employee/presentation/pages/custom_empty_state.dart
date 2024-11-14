import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyStatePage extends StatelessWidget {
  final String pathToPic;
  final String appBarTittle;
  final List<Widget>? actions;

  const EmptyStatePage({
    super.key,
    required this.pathToPic,
    required this.appBarTittle,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          appBarTittle,
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: actions,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 240,
            right: 100,
            child: Image.asset(
              pathToPic,
              height: 142.h,
              width: 215.w,
            ),
          ),
          Positioned(
            bottom: 300,
            right: 165,
            child: Text('Тут пока пусто'),
          ),
          Positioned(
            bottom: 235,
            right: 125,
            child: SizedBox(
              child: Text(
                  'Добавьте сотрудников,\nчтобы обеспечить более\n удобный учет'),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              child: SvgPicture.asset(
                'assets/icons/floating.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
