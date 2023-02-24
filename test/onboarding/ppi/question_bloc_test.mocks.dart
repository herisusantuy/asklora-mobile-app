// Mocks generated by Mockito 5.3.2 from annotations
// in asklora_mobile_app/test/onboarding/ppi/question_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/utils/storage/shared_preference.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/fixture.dart'
    as _i2;
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/ppi_question_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFixture_0 extends _i1.SmartFake implements _i2.Fixture {
  _FakeFixture_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PpiQuestionRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPpiQuestionRepository extends _i1.Mock
    implements _i3.PpiQuestionRepository {
  MockPpiQuestionRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Fixture> fetchPersonalAndPrivacyQuestions() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchPersonalAndPrivacyQuestions,
          [],
        ),
        returnValue: _i4.Future<_i2.Fixture>.value(_FakeFixture_0(
          this,
          Invocation.method(
            #fetchPersonalAndPrivacyQuestions,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Fixture>);
  @override
  _i4.Future<_i2.Fixture> fetchInvestmentStyleQuestions(String? accountId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchInvestmentStyleQuestions,
          [accountId],
        ),
        returnValue: _i4.Future<_i2.Fixture>.value(_FakeFixture_0(
          this,
          Invocation.method(
            #fetchInvestmentStyleQuestions,
            [accountId],
          ),
        )),
      ) as _i4.Future<_i2.Fixture>);
  @override
  _i4.Future<_i2.Fixture> getQuestions() => (super.noSuchMethod(
        Invocation.method(
          #getQuestions,
          [],
        ),
        returnValue: _i4.Future<_i2.Fixture>.value(_FakeFixture_0(
          this,
          Invocation.method(
            #getQuestions,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Fixture>);
}

/// A class which mocks [SharedPreference].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreference extends _i1.Mock implements _i5.SharedPreference {
  MockSharedPreference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> deleteAllData() => (super.noSuchMethod(
        Invocation.method(
          #deleteAllData,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> deleteData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [key],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String?> readData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readData,
          [key],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<bool> writeData(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeData,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> writeIntData(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeIntData,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<int?> readIntData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readIntData,
          [key],
        ),
        returnValue: _i4.Future<int?>.value(),
      ) as _i4.Future<int?>);
}
