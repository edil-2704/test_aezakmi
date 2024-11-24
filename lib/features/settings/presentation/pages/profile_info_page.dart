import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
        title: const Text(
          'Информация',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xFF252525),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BuildListTileWidget(title: 'Политика конфиденциальности'),
            BuildListTileWidget(title: 'Пользовательское соглашение'),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(String url, {bool inApp = false}) async {
  final Uri uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: inApp
            ? LaunchMode.inAppWebView
            : LaunchMode
                .externalApplication, // Используйте этот режим для открытия в браузере
      );
    } else {
      log('Не удалось открыть URL: $url');
    }
  } catch (e) {
    log('Ошибка открытия URL: $e');
  }
}

class BuildListTileWidget extends StatelessWidget {
  final String title;
  const BuildListTileWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 11.0),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF252525),
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Color(0xFF818181)),
          onTap: () {
            _launchUrl('https://pub.dev/', inApp: false);
          },
        ),
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}
