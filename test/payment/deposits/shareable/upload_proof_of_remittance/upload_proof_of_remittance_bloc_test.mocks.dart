// Mocks generated by Mockito 5.3.0 from annotations
// in asklora_mobile_app/test/payment/deposits/shareable/upload_proof_of_remittance/upload_proof_of_remittance_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:asklora_mobile_app/feature/payment/deposits/repository/file_picker_repository.dart'
    as _i2;
import 'package:file_picker/file_picker.dart' as _i4;
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

/// A class which mocks [FilePickerRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFilePickerRepository extends _i1.Mock
    implements _i2.FilePickerRepository {
  MockFilePickerRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.PlatformFile?> pickFile(
          {_i4.FileType? fileType = _i4.FileType.any}) =>
      (super.noSuchMethod(
              Invocation.method(#pickFile, [], {#fileType: fileType}),
              returnValue: _i3.Future<_i4.PlatformFile?>.value())
          as _i3.Future<_i4.PlatformFile?>);
}
