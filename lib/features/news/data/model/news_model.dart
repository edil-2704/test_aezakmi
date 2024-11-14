import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NewsItem extends HiveObject {
  @HiveField(0)
  final String imagePath;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String time;

  NewsItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });
}

class NewsImagesModel {
  final List<String> urls;
  int currentIndex = 0;

  NewsImagesModel({required this.urls});

  String getNextImageUrl() {
    final imageUrl = urls[currentIndex];
    currentIndex = (currentIndex + 1) % urls.length;
    return imageUrl;
  }
}

final imagesLocation = NewsImagesModel(
  urls: [
    'assets/images/news_1.png',
    'assets/images/news_3.png',
    'assets/images/news_4.png',
    'assets/images/news_6.png',
    'assets/images/news_7.png',
  ],
);

class NewsTextModel {
  final List<String> texts;
  int currentIndex = 0;

  NewsTextModel({required this.texts});

  String getNextText() {
    final textUrl = texts[currentIndex];
    currentIndex = (currentIndex + 1) % texts.length;
    return textUrl;
  }
}

final textLocation = NewsTextModel(
  texts: [
    'В современном мире информационных технологий, лидерство играет важную роль в успешной работе команды разработчиков и IT-специалистов. Управление и мотивация такой команды требует особых навыков и стратегий. В этой статье мы рассмотрим несколько ключевых аспектов эффективного руководства в IT-сфере.',
    'В современном мире информационных технологий, лидерство играет важную роль в успешной работе команды разработчиков и IT-специалистов. Управление и мотивация такой команды требует особых навыков и стратегий. В этой статье мы рассмотрим несколько ключевых аспектов эффективного руководства в IT-сфере.',
    'В современном мире информационных технологий, лидерство играет важную роль в успешной работе команды разработчиков и IT-специалистов. Управление и мотивация такой команды требует особых навыков и стратегий. В этой статье мы рассмотрим несколько ключевых аспектов эффективного руководства в IT-сфере.',
    'В современном мире информационных технологий, лидерство играет важную роль в успешной работе команды разработчиков и IT-специалистов. Управление и мотивация такой команды требует особых навыков и стратегий. В этой статье мы рассмотрим несколько ключевых аспектов эффективного руководства в IT-сфере.',
    'В современном мире информационных технологий, лидерство играет важную роль в успешной работе команды разработчиков и IT-специалистов. Управление и мотивация такой команды требует особых навыков и стратегий. В этой статье мы рассмотрим несколько ключевых аспектов эффективного руководства в IT-сфере.',
    'В современном мире информационных технологий, лидерство играет важную роль в успешной работе команды разработчиков и IT-специалистов. Управление и мотивация такой команды требует особых навыков и стратегий. В этой статье мы рассмотрим несколько ключевых аспектов эффективного руководства в IT-сфере.',
  ],
);
