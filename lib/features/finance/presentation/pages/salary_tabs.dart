import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/logic/bloc/finance_bloc.dart';

class SalariesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FinanceLoadedSalariesState) {
          return ListView.builder(
            itemCount: state.salaries.length,
            itemBuilder: (context, index) {
              final salary = state.salaries[index];
              return ListTile(
                title: Text(salary.amount),
                subtitle: Text(salary.date),
              );
            },
          );
        } else if (state is FinanceErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: Text('No salaries'));
      },
    );
  }
}
