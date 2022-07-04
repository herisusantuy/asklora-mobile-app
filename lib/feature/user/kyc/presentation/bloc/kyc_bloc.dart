import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'kyc_event.dart';

part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  KycBloc(super.initialState);
}
