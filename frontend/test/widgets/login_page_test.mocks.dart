// Mocks generated by Mockito 5.1.0 from annotations
// in frontend/test/widgets/login_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter/material.dart' as _i5;
import 'package:frontend/api/api_response.dart' as _i2;
import 'package:frontend/api/authentication/auth_client.dart' as _i3;
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

class _FakeApiResponse_0 extends _i1.Fake implements _i2.ApiResponse {}

/// A class which mocks [AuthClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthClient extends _i1.Mock implements _i3.AuthClient {
  MockAuthClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ApiResponse> login({String? username, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #login, [], {#username: username, #password: password}),
              returnValue: Future<_i2.ApiResponse>.value(_FakeApiResponse_0()))
          as _i4.Future<_i2.ApiResponse>);
  @override
  _i4.Future<_i2.ApiResponse> logout(_i5.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#logout, [context]),
              returnValue: Future<_i2.ApiResponse>.value(_FakeApiResponse_0()))
          as _i4.Future<_i2.ApiResponse>);
  @override
  _i4.Future<_i2.ApiResponse> createAccount(
          {String? username, String? password, String? email}) =>
      (super.noSuchMethod(
              Invocation.method(#createAccount, [],
                  {#username: username, #password: password, #email: email}),
              returnValue: Future<_i2.ApiResponse>.value(_FakeApiResponse_0()))
          as _i4.Future<_i2.ApiResponse>);
}

/// A class which mocks [NavigatorObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorObserver extends _i1.Mock implements _i5.NavigatorObserver {
  @override
  void didPush(_i5.Route<dynamic>? route, _i5.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPush, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didPop(_i5.Route<dynamic>? route, _i5.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPop, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didRemove(
          _i5.Route<dynamic>? route, _i5.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didRemove, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didReplace(
          {_i5.Route<dynamic>? newRoute, _i5.Route<dynamic>? oldRoute}) =>
      super.noSuchMethod(
          Invocation.method(
              #didReplace, [], {#newRoute: newRoute, #oldRoute: oldRoute}),
          returnValueForMissingStub: null);
  @override
  void didStartUserGesture(
          _i5.Route<dynamic>? route, _i5.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(
          Invocation.method(#didStartUserGesture, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didStopUserGesture() =>
      super.noSuchMethod(Invocation.method(#didStopUserGesture, []),
          returnValueForMissingStub: null);
}