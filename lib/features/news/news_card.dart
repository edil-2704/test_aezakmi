import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCardPage extends StatelessWidget {
  const NewsCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topLeft,
            children: [
              Image.asset(
                'assets/images/icon.png',
                width: double.infinity,
                height: 411.h,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 16,
                top: 40,
                child: BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 235.h,
                left: 120.w,
                child: SizedBox(
                  height: 132.h,
                  width: 132.w,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(66.0),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/vector.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Лидерство в IT: Как эффективно руководить командой разработчиков и IT-специалистов.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Сегодня 13:00',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF818181),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: Text(
                    'В современном мире информационных технологий, лидерство играет важную роль в успешной работе команды разработчиков и IT-специалистов. Управление и мотивация такой команды требует особых навыков и стратегий. В этой статье мы рассмотрим несколько ключевых аспектов эффективного руководства в IT-сфере.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF252525),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                BuildSection(
                  title: 'Глава 1',
                  subtitle: 'Понимание технического контекста',
                  content:
                      'Хороший лидер в IT должен обладать базовым пониманием технологий и процессов...',
                ),
                const SizedBox(height: 20),
                BuildSection(
                  title: 'Глава 2',
                  subtitle: 'Установление четких целей и ожиданий',
                  content:
                      'Лидерство в IT требует умения поставить ясные цели и ожидания для команды...',
                ),
                const SizedBox(height: 20),
                BuildSection(
                  title: 'Глава 3',
                  subtitle: 'Развитие команды',
                  content:
                      'Успешный лидер в IT ставит перед собой задачу развития и поддержания навыков своей команды...',
                ),
                const SizedBox(height: 20),
                BuildSection(
                  title: 'Глава 4',
                  subtitle: 'Коммуникация и сотрудничество',
                  content:
                      'Эффективное лидерство в IT включает в себя активную коммуникацию и сотрудничество с членами команды...',
                ),
                const SizedBox(height: 20),
                BuildSection(
                  title: 'Глава 5',
                  subtitle: 'Управление конфликтами',
                  content:
                      'Конфликты могут возникать в любой команде, и важно, чтобы лидер в IT умел эффективно управлять ими...',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;

  const BuildSection(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF252525),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF252525),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF252525),
          ),
        ),
      ],
    );
  }
}
