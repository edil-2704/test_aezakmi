import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Анна');
  final TextEditingController _surnameController =
      TextEditingController(text: 'Иванова');
  final TextEditingController _emailController =
      TextEditingController(text: 'Annaivanova@gmail.com');
  final TextEditingController _phoneController =
      TextEditingController(text: '+7 (904) 089 87 86');

  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadSavedImage(); // Загрузка сохраненного изображения при инициализации
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      setState(() {
        _profileImage = imageFile;
      });
      await _saveImageLocally(imageFile);
    }
  }

  Future<void> _saveImageLocally(File imageFile) async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/profile_image.png';
      await imageFile.copy(imagePath);
    } catch (e) {
      print('Ошибка сохранения изображения: $e');
    }
  }

  Future<void> _loadSavedImage() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/profile_image.png';
      final File savedImage = File(imagePath);

      if (await savedImage.exists()) {
        setState(() {
          _profileImage = savedImage;
        });
      }
    } catch (e) {
      print('Ошибка загрузки сохраненного изображения: $e');
    }
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Удалить аккаунт?'),
          content: const Text('Вы уверены, что хотите удалить свой аккаунт?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // delete method
                });

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Аккаунт удален'),
                  ),
                );
              },
              child: const Text('Удалить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
        title: const Text(
          'Настройки профиля',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Color(0xFF252525),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/images/icon.png')
                            as ImageProvider,
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color(0xFFF2F5F7),
                      child:
                          const Icon(Icons.edit, size: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            InputFieldType(
              label: 'Имя',
              controller: _nameController,
            ),
            InputFieldType(
              label: 'Фамилия',
              controller: _surnameController,
            ),
            InputFieldType(
              label: 'Email',
              controller: _emailController,
            ),
            InputFieldType(
              label: 'Телефон',
              controller: _phoneController,
            ),
            const Spacer(),
            TextButton(
              onPressed: _deleteAccount,
              child: Text(
                'Удалить аккаунт',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainRed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputFieldType extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const InputFieldType(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F7),
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Color(0xFF252525),
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF252525),
        ),
      ),
    );
  }
}
