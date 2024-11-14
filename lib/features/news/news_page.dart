import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_aezakmi/features/news/data/model/news_model.dart';
import 'package:test_aezakmi/features/news/news_card.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final url = imagesLocation.getNextImageUrl();
    final texts = textLocation.getNextText();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainBackground,
        title: const Text('Новости'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: url.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsCardPage()));
              },
              child: BuildCard(
                  imagePath: url,
                  title: texts,
                  description: texts,
                  date: 'date',
                  time: 'time'),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
        ),
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
