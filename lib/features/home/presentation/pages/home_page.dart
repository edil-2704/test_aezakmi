import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Сотрудники',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 115.h,
                child: Card(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/home.svg',
                          color: Colors.blue,
                        ),
                        Text('data'),
                      ],
                    ),
                    Row(
                      children: [],
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                )),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.h);
            },
          ),
          Positioned(
            bottom: 10,
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

class EmptyStateHomePage extends StatelessWidget {
  const EmptyStateHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Сотрудники',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 240,
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
