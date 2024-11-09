import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_aezakmi/internal/helpers/localization/localization_hive.dart';


part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitialState()) {
    on<ChangeLocaleEvent>(
      (event, emit) {
        emit(LocalizationLoadingState());
        try {
          LocalizationHive.setLocale(event.locale);

          final String locale = LocalizationHive.getLocale();

          emit(LocalizationLoadedState(updatedLocale: locale));
        } catch (e) {
          emit(LocalizationErrorState());
        }
      },
    );
  }
}
