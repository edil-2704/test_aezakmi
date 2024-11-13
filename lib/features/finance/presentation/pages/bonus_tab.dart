import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_aezakmi/features/finance/data/models/bonus_model.dart';
import 'package:test_aezakmi/features/finance/presentation/logic/bloc/finance_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/empty_finance_state_page.dart';

class BonusesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is FinanceLoadedBonusesState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: state.bonuses.length,
              itemBuilder: (context, index) {
                final bonus = state.bonuses[index];
                return _buildBonusCard(bonus);
              },
            ),
          );
        } else if (state is FinanceErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: EmptyFinanceStatePage());
      },
    );
  }

  Widget _buildBonusCard(Bonus bonus) {
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
            _buildDetail(bonus.date),
            _buildDetail(bonus.amount),
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
}
