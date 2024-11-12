import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/text_buttons.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          BuildCard(
            imagePath: 'assets/images/icon.png',
            title:
                'Лидерство в IT: Как эффективно руководить командой разработчиков и IT-специалистов.',
            description:
                'В современном мире информационных технологий, лидерство играет важную роль в успешной работе...',
            date: 'Сегодня',
            time: '13:00',
          ),
          BuildCard(
            imagePath: 'assets/images/icon.png',
            title:
                'Стратегическое управление в IT: Как разработать и реализовать стратегию для компании.',
            description:
                'Стратегическое управление в IT является неотъемлемой частью успеха любой компании в сфере информационных...',
            date: '30 января',
            time: '15:00',
          ),
          BuildCard(
            imagePath: 'assets/images/icon.png',
            title:
                'Управление проектами: Как эффективно планировать, организовывать и контролировать проекты в IT сфере.',
            description:
                'Перед тем как приступить к управлению проектами, важно понять основные концепции и термины, связанные...',
            date: '20 января',
            time: '13:00',
          ),
          BuildCard(
            imagePath: 'assets/images/icon.png',
            title:
                'Инновации в IT: Как стимулировать инновационное мышление и развивать новые технологические решения.',
            description:
                'Инновации являются движущей силой в сфере информационных технологий. Они позволяют компаниям...',
            date: '15 января',
            time: '15:00',
          ),
          BuildCard(
            imagePath: 'assets/images/icon.png',
            title:
                'Управление изменениями в IT: Как эффективно внедрять изменения в IT компании и минимизировать сопротивление сотрудников.',
            description:
                'Управление изменениями является неотъемлемой частью развития и успеха IT компаний. Внедрение изменений мою...',
            date: '10 января',
            time: '11:00',
          ),
        ],
      ),
    );
  }
}

class BuildCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String date;
  final String time;

  const BuildCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Image.asset(imagePath,
                height: 232.h, width: 358.w, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252525),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF252525),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF818181),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF818181),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
