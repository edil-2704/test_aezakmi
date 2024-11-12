import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _ratingValue =
      2; // начальное значение для слайдера (0–4, соответствует выбранному эмодзи)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Обратная связь'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Оценить приложение',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF252525),
              ),
            ),
            const SizedBox(height: 16),
            _buildEmojiRatingSlider(),
            const SizedBox(height: 32),
            const Text(
              'Хотите рассказать больше?',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF252525),
              ),
            ),
            const SizedBox(height: 8),
            const FeedbackBox(),
            const Spacer(),
            const SubmitButton(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiRatingSlider() {
    final emojiIcons = [
      '😖', // worst
      '😟', // bad
      '😐', // neutral
      '😀', // good
      '😍', // love it
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: emojiIcons.map((emoji) {
            return Text(
              emoji,
              style: TextStyle(
                fontSize: 34,
                color: emojiIcons.indexOf(emoji) == _ratingValue.toInt()
                    ? Colors.blue
                    : Colors.black,
              ),
            );
          }).toList(),
        ),
        Slider(
          value: _ratingValue,
          min: 0,
          max: 4,
          divisions: 4,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              _ratingValue = value;
            });
          },
        ),
      ],
    );
  }
}

class FeedbackBox extends StatelessWidget {
  const FeedbackBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const TextField(
        maxLines: 5, // количество строк для поля ввода
        decoration: InputDecoration(
          hintText:
              'Напишите нам о своих идеях или проблемах. Нам это важно, мы постараемся их решить.',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xFF818181),
          ),
          border: InputBorder.none, // убираем стандартную рамку
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2253F6), Color(0xFF9DB4FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(60),
      ),
      child: const Center(
        child: Text(
          'Оценить',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
