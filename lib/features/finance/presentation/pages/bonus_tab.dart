import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_aezakmi/features/finance/data/models/bonus_model.dart';
import 'package:test_aezakmi/features/finance/presentation/logic/bloc/finance_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/empty_finance_state_page.dart';

class BonusesTab extends StatefulWidget {
  final String labelText;
  const BonusesTab({super.key, required this.labelText});

  @override
  State<BonusesTab> createState() => _BonusesTabState();
}

class _BonusesTabState extends State<BonusesTab> {
  bool _isFilterChipVisible = true;

  DateTime? _selectedDate;

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (state is FinanceLoadedBonusesState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isFilterChipVisible && _selectedDate != null)
                  Chip(
                    label: Text(widget.labelText),
                    onDeleted: () {
                      ClearSelectionEvent();
                    },
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.bonuses.length,
                  itemBuilder: (context, index) {
                    final bonus = state.bonuses[index];
                    return BonusCard(bonus: bonus);
                  },
                ),
              ],
            ),
          );
        }
        if (state is FinanceErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: EmptyFinanceStatePage());
      },
    );
  }
}

class BonusCard extends StatelessWidget {
  final BonusModel bonus;

  const BonusCard({
    super.key,
    required this.bonus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Новогодняя премия',
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF252525),
              ),
            ),
            const SizedBox(height: 8.0),
            DetailPart(
              text: bonus.amount.toString(),
            ),
            DetailPart(text: bonus.amount.toString()),
          ],
        ),
      ),
    );
  }
}

class DetailPart extends StatelessWidget {
  final String text;
  const DetailPart({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
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
}
