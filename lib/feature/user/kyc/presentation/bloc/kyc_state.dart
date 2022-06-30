part of 'kyc_bloc.dart';

enum KycStateStatus { success, failure, unknown, loading }

class KycState extends Equatable {
  final KycStateStatus status;
  final String token;

  const KycState({this.status = KycStateStatus.unknown, required this.token});

  @override
  List<Object?> get props => [];
}
