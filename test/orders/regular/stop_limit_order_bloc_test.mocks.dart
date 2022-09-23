// Mocks generated by Mockito 5.2.0 from annotations
// in asklora_mobile_app/test/orders/regular/stop_limit_order_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:asklora_mobile_app/core/domain/base_response.dart' as _i2;
import 'package:asklora_mobile_app/feature/orders/domain/order_request.dart'
    as _i6;
import 'package:asklora_mobile_app/feature/orders/domain/order_response.dart'
    as _i5;
import 'package:asklora_mobile_app/feature/orders/repository/orders_repository.dart'
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

class _FakeBaseResponse_0<T> extends _i1.Fake implements _i2.BaseResponse<T> {}

/// A class which mocks [OrdersRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockOrdersRepository extends _i1.Mock implements _i3.OrdersRepository {
  MockOrdersRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BaseResponse<_i5.OrderResponse>> submitOrder(
          {_i6.OrderRequest? orderRequest}) =>
      (super.noSuchMethod(
          Invocation.method(#submitOrder, [], {#orderRequest: orderRequest}),
          returnValue: Future<_i2.BaseResponse<_i5.OrderResponse>>.value(
              _FakeBaseResponse_0<_i5.OrderResponse>())) as _i4
          .Future<_i2.BaseResponse<_i5.OrderResponse>>);
}
