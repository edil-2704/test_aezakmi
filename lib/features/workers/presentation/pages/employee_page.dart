import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_aezakmi/features/workers/presentation/pages/add_employee_page.dart';

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
                child: CustomEmployeeCard(),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEmployeePage(),
                  ),
                );
              },
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

class CustomEmployeeCard extends StatelessWidget {
  final Widget? svgPic;
  const CustomEmployeeCard({
    super.key,
    this.svgPic,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(16),
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
            children: [
              Text('data'),
            ],
          ),
          Row(
            children: [
              Text('data'),
            ],
          ),
        ],
      ),
    ));
  }
}
