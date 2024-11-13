import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/logic/bloc/finance_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/empty_finance_state_page.dart';

class BonusesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FinanceLoadedBonusesState) {
          return ListView.builder(
            itemCount: state.bonuses.length,
            itemBuilder: (context, index) {
              final bonus = state.bonuses[index];
              return ListTile(
                title: Text(bonus.amount),
                subtitle: Text(bonus.date),
              );
            },
          );
        } else if (state is FinanceErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: EmptyFinanceStatePage());
      },
    );
  }
}
