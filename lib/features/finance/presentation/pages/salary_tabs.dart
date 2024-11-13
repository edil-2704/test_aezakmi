import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/logic/bloc/finance_bloc.dart';
import 'package:test_aezakmi/features/finance/presentation/pages/empty_finance_state_page.dart';
import 'package:test_aezakmi/features/finance/presentation/widgets/build_widgets.dart';

class SalariesTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinanceBloc, FinanceState>(
      builder: (context, state) {
        if (state is FinanceLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (state is FinanceLoadedSalariesState) {
          return ListView.builder(
            itemCount: state.salaries.length,
            itemBuilder: (context, index) {
              final salaries = state.salaries[index];
              return BuildSalaryCard(
                salaries: salaries,
              );
            },
          );
        }

        if (state is FinanceErrorState) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }
        return const Center(
          child: EmptyFinanceStatePage(),
        );
      },
    );
  }
}
