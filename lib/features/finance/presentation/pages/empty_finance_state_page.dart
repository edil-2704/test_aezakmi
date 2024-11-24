import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyFinanceStatePage extends StatelessWidget {
  const EmptyFinanceStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: BuildEmptyState(),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/add_people.png',
            height: 142.h,
            width: 215.w,
          ),
          Text(
            'Тут пока пусто',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          Wrap(
            children: [
              Text(
                'Добавьте сотрудников, \nчтобы обеспечить \nболее удобный учет',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff818181)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
