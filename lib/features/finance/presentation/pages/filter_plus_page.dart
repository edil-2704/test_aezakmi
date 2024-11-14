import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the selected date

class FilterPlusPage extends StatefulWidget {
  const FilterPlusPage({super.key});

  @override
  _FilterPlusPageState createState() => _FilterPlusPageState();
}

class _FilterPlusPageState extends State<FilterPlusPage> {
  int _selectedTabIndex = 0;
  bool _isFilterChipVisible = true;

  DateTime? _selectedDate; // Stores the selected date

  final List<String> _tabs = ['Выговор', 'Премия', 'Зарплата'];
  final DateFormat _dateFormat =
      DateFormat('dd.MM.yyyy'); // Format for displaying date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Финансы',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color(0xFF252525),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
              onPressed: _showDatePicker, // Open the date picker on press
              icon: const Icon(Icons.filter_alt, color: Colors.white),
              label: const Text(
                'Фильтры',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                backgroundColor: const Color(0xFF2253F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tab Bar
            _buildTabBar(),
            const SizedBox(height: 20),
            // Selected Filter Chip
            if (_isFilterChipVisible && _selectedDate != null)
              _buildFilterChip(),
            const SizedBox(height: 20),
            // Bonus Card
            _buildBonusCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _tabs.asMap().entries.map((entry) {
        int index = entry.key;
        String tab = entry.value;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTabIndex = index;
            });
          },
          child: Text(
            tab,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _selectedTabIndex == index
                  ? const Color(0xFF252525)
                  : const Color(0xFF818181),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFilterChip() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: const Color(0xFFDEE5FF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _dateFormat.format(_selectedDate!),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2253F6),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 17, color: Color(0xFF2253F6)),
              onPressed: () {
                setState(() {
                  _isFilterChipVisible = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBonusCard() {
    return Card(
      margin: const EdgeInsets.only(top: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      color: const Color(0xFFF2F5F7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _tabs[_selectedTabIndex],
              style: const TextStyle(
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF252525),
              ),
            ),
            const SizedBox(height: 8.0),
            _buildDetail('24 января 2024'),
            _buildDetail('Федотова Елизавета Никитична'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String text) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 4, color: Color(0xFF818181)),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'SF Pro Text',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF818181),
          ),
        ),
      ],
    );
  }

  // Function to show the date picker
  Future<void> _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _isFilterChipVisible = true;
      });
    }
  }
}
