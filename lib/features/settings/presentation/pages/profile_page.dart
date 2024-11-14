import 'package:flutter/material.dart';
import 'package:test_aezakmi/features/settings/presentation/pages/feedback_page.dart';
import 'package:test_aezakmi/features/settings/presentation/pages/profile_info_page.dart';
import 'package:test_aezakmi/features/settings/presentation/pages/profile_settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Настройки',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color(0xFF252525),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 55,
              backgroundImage:
                  AssetImage('assets/images/news_1.png'), // Image asset
            ),
            const SizedBox(height: 10),
            const Text(
              'Анна Иванова',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF252525),
              ),
            ),
            const SizedBox(height: 40),
            ChangePagesTile(
              title: 'Настройка профиля',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileSettings()));
              },
            ),
            ChangePagesTile(
              title: 'Обратная связь',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()));
              },
            ),
            ChangePagesTile(
              title: 'Информация',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileInfoPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePagesTile extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ChangePagesTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF252525),
            ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Color(0xFF818181)),
          onTap: onTap,
        ),
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}
