import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/test.dart';

class EmptyFinanceStatePage extends StatelessWidget {
  const EmptyFinanceStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BuildEmptyState(),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WarningPage()));
            },
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            child: SvgPicture.asset(
              'assets/icons/floating.svg',
            ),
          ),
        ],
      ),
    );
  }
}

class BuildEmptyState extends StatelessWidget {
  const BuildEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: 200,
            right: 100,
            child: Image.asset(
              'assets/images/add_people.png',
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
        ],
      ),
    );
  }
}
