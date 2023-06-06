// Mocks generated by Mockito 5.4.1 from annotations
// in asklora_mobile_app/test/payment/deposits/shareable/upload_proof_of_remittance/upload_proof_of_remittance_bloc_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/payment/deposits/repository/file_picker_repository.dart'
    as _i3;
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/proof_of_remittance/domain/proof_of_remittance_response.dart'
    as _i7;
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/proof_of_remittance/repository/proof_of_remittance_repository.dart'
    as _i6;
import 'package:file_picker/file_picker.dart' as _i5;
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

class _FakeBaseResponse_0<T> extends _i1.SmartFake
    implements _i2.BaseResponse<T> {
  _FakeBaseResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FilePickerRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilePickerRepository extends _i1.Mock
    implements _i3.FilePickerRepository {
  MockFilePickerRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.PlatformFile?> pickFile(
          {_i5.FileType? fileType = _i5.FileType.any}) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickFile,
          [],
          {#fileType: fileType},
        ),
        returnValue: _i4.Future<_i5.PlatformFile?>.value(),
      ) as _i4.Future<_i5.PlatformFile?>);
  @override
  _i4.Future<List<_i5.PlatformFile>> pickFiles(
          {_i5.FileType? fileType = _i5.FileType.any}) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickFiles,
          [],
          {#fileType: fileType},
        ),
        returnValue:
            _i4.Future<List<_i5.PlatformFile>>.value(<_i5.PlatformFile>[]),
      ) as _i4.Future<List<_i5.PlatformFile>>);
}

/// A class which mocks [ProofOfRemittanceRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProofOfRemittanceRepository extends _i1.Mock
    implements _i6.ProofOfRemittanceRepository {
  MockProofOfRemittanceRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<
      _i2.BaseResponse<_i7.ProofOfRemittanceResponse>> submitProofOfRemittance({
    required double? depositAmount,
    required List<_i5.PlatformFile>? platformFiles,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #submitProofOfRemittance,
          [],
          {
            #depositAmount: depositAmount,
            #platformFiles: platformFiles,
          },
        ),
        returnValue:
            _i4.Future<_i2.BaseResponse<_i7.ProofOfRemittanceResponse>>.value(
                _FakeBaseResponse_0<_i7.ProofOfRemittanceResponse>(
          this,
          Invocation.method(
            #submitProofOfRemittance,
            [],
            {
              #depositAmount: depositAmount,
              #platformFiles: platformFiles,
            },
          ),
        )),
      ) as _i4.Future<_i2.BaseResponse<_i7.ProofOfRemittanceResponse>>);
}
