// Mocks generated by Mockito 5.4.4 from annotations
// in nyt/test/news/cubit/news_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:connectivity_plus/connectivity_plus.dart' as _i9;
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart'
    as _i10;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nyt/core/error/failure.dart' as _i6;
import 'package:nyt/core/protobuf/news_request/news.pb.dart' as _i8;
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart' as _i7;
import 'package:nyt/features/news/domain/repositories/base_news_repository.dart'
    as _i2;
import 'package:nyt/features/news/domain/use_cases/get_news_usecase.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBaseNewsRepository_0 extends _i1.SmartFake
    implements _i2.BaseNewsRepository {
  _FakeBaseNewsRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetNewsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNewsUseCase extends _i1.Mock implements _i4.GetNewsUseCase {
  MockGetNewsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BaseNewsRepository get newsRepository => (super.noSuchMethod(
        Invocation.getter(#newsRepository),
        returnValue: _FakeBaseNewsRepository_0(
          this,
          Invocation.getter(#newsRepository),
        ),
      ) as _i2.BaseNewsRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.NewsResponse>>> execute(
          _i8.NewsRequest? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [params],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.NewsResponse>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.NewsResponse>>(
          this,
          Invocation.method(
            #execute,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.NewsResponse>>>);
}

/// A class which mocks [Connectivity].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivity extends _i1.Mock implements _i9.Connectivity {
  MockConnectivity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<List<_i10.ConnectivityResult>> get onConnectivityChanged =>
      (super.noSuchMethod(
        Invocation.getter(#onConnectivityChanged),
        returnValue: _i5.Stream<List<_i10.ConnectivityResult>>.empty(),
      ) as _i5.Stream<List<_i10.ConnectivityResult>>);

  @override
  _i5.Future<List<_i10.ConnectivityResult>> checkConnectivity() =>
      (super.noSuchMethod(
        Invocation.method(
          #checkConnectivity,
          [],
        ),
        returnValue: _i5.Future<List<_i10.ConnectivityResult>>.value(
            <_i10.ConnectivityResult>[]),
      ) as _i5.Future<List<_i10.ConnectivityResult>>);
}
