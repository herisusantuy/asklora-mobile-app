import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/repository/bank_details_repository.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_list/bloc/select_bank_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_list/domain/bank_details.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'select_bank_bloc_test.mocks.dart';

@GenerateMocks([BankDetailsRepository])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  List<BankDetails> bankDetails = [const BankDetails(1, 'BCA', 'asd', 'BBCA')];

  group('*Select Bank Bloc Test*', () {
    late MockBankDetailsRepository bankDetailsRepository;
    late SelectBankBloc selectBankBloc;

    setUpAll(() async {
      bankDetailsRepository = MockBankDetailsRepository();
    });

    setUp(() async {
      selectBankBloc =
          SelectBankBloc(bankDetailsRepository: bankDetailsRepository);
    });

    test('init state should be null', () async {
      expect(selectBankBloc.state, const SelectBankState());
    });

    blocTest<SelectBankBloc, SelectBankState>('Get List of Banks',
        build: () {
          when(bankDetailsRepository.getBankDetails())
              .thenAnswer((_) => Future.value([
                    const BankDetails(1, 'BCA', 'asd', 'BBCA'),
                  ]));
          return selectBankBloc;
        },
        act: (bloc) {
          bloc.add(GetListBanks());
        },
        expect: () => {
              const SelectBankState(
                  response: BaseResponse<List<BankDetails>>(
                state: ResponseState.loading,
                data: [],
              )),
              SelectBankState(
                  response: BaseResponse<List<BankDetails>>(
                      state: ResponseState.success, data: bankDetails)),
            });
    blocTest<SelectBankBloc, SelectBankState>('Search List of Banks',
        build: () {
          when(bankDetailsRepository.getBankDetails())
              .thenAnswer((_) => Future.value([
                    const BankDetails(1, 'BCA', 'asd', 'BBCA'),
                  ]));
          return selectBankBloc;
        },
        act: (bloc) {
          bloc.add(GetListBanks());
          bloc.add(const SearchBank('BCA'));
        },
        expect: () => {
              const SelectBankState(
                  response: BaseResponse<List<BankDetails>>(
                state: ResponseState.loading,
                data: [],
              )),
              SelectBankState(
                  response: BaseResponse<List<BankDetails>>(
                      state: ResponseState.success, data: bankDetails)),
            });
    tearDown(() => selectBankBloc.close());
  });
}
