import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class EmptyFinanceStatePage extends StatelessWidget {
  const EmptyFinanceStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Финансы',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
          ),
          actions: [
            CustomTextButton(
              height: 30.h,
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
              ),
              width: 90.w,
              text: 'Filter',
              onPressed: () {},
            ),
            SizedBox(width: 16),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Выговор'),
              Tab(text: 'Премия'),
              Tab(text: 'Зарплата'),
            ],
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            BuildEmptyState(),
            BuildEmptyState(),
            BuildEmptyState(),
          ],
        ),
        floatingActionButton: InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: SvgPicture.asset(
            'assets/icons/floating.svg',
          ),
        ),
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
