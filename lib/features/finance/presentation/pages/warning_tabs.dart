import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/logic/bloc/finance_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/empty_finance_state_page.dart';
import 'package:test_aezakmi/features/workers/presentation/widget/custom_employee_card.dart';

class WarningsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is FinanceLoadedWarningsState) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: state.warnings.length,
              itemBuilder: (context, index) {
                final warning = state.warnings[index];
                return EmployeeCard(
                  name: warning.name,
                  jobTitle: warning.details,
                  date: warning.date,
                  salary: warning.id,
                );
              },
            ),
          );
        }

        if (state is FinanceErrorState) {
          return const EmptyFinanceStatePage();
        }
        return const Center(child: EmptyFinanceStatePage());
      },
    );
  }
}
