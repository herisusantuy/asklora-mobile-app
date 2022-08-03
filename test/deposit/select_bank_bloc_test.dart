import 'package:asklora_mobile_app/feature/deposit/bloc/list_bank/select_bank_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/model/bank_details.dart';
import 'package:asklora_mobile_app/feature/deposit/repository/bank_details_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'select_bank_bloc_test.mocks.dart';

@GenerateMocks([BankDetailsRepository])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      expect(selectBankBloc.state, const SelectBankState(listBanks: null));
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
              const SelectBankState(listBanks: [
                BankDetails(1, 'BCA', 'asd', 'BBCA'),
              ]),
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
              const SelectBankState(listBanks: [
                BankDetails(1, 'BCA', 'asd', 'BBCA'),
              ]),
            });
    tearDown(() => selectBankBloc.close());
  });
}
