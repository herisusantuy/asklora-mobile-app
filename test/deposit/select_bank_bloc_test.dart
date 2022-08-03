import 'package:asklora_mobile_app/feature/deposit/bloc/list_bank/select_bank_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/model/list_bank.dart';
import 'package:asklora_mobile_app/feature/deposit/repository/list_bank_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'select_bank_bloc_test.mocks.dart';

@GenerateMocks([ListBankRepository])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('*Select Bank Bloc Test*', () {
    late MockListBankRepository listBankRepository;
    late SelectBankBloc selectBankBloc;

    setUpAll(() async {
      listBankRepository = MockListBankRepository();
    });

    setUp(() async {
      selectBankBloc = SelectBankBloc(listBankRepository: listBankRepository);
    });

    test('init state should be null', () async {
      expect(selectBankBloc.state,
          const SelectBankState(listBanks: null, searchListBank: null));
    });

    blocTest<SelectBankBloc, SelectBankState>('Get List of Banks',
        build: () {
          when(listBankRepository.getListBank())
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
          when(listBankRepository.getListBank())
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
              const SelectBankState(listBanks: [
                BankDetails(1, 'BCA', 'asd', 'BBCA'),
              ], searchListBank: [
                BankDetails(1, 'BCA', 'asd', 'BBCA'),
              ]),
            });
    tearDown(() => selectBankBloc.close());
  });
}
