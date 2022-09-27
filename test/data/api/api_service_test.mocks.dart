// Mocks generated by Mockito 5.3.2 from annotations
// in restaurant_app/test/data/api/api_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i9;
import 'dart:typed_data' as _i10;

import 'package:http/http.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:restaurant_app/data/api/api_service.dart' as _i7;
import 'package:restaurant_app/data/model/detail_restaurant_result.dart' as _i3;
import 'package:restaurant_app/data/model/post_review_result.dart' as _i5;
import 'package:restaurant_app/data/model/restaurants_result.dart' as _i2;
import 'package:restaurant_app/data/model/search_restaurant_resut.dart' as _i4;

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

class _FakeRestaurantsResult_0 extends _i1.SmartFake
    implements _i2.RestaurantsResult {
  _FakeRestaurantsResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDetailRestaurantResult_1 extends _i1.SmartFake
    implements _i3.DetailRestaurantResult {
  _FakeDetailRestaurantResult_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSearchRestaurantResult_2 extends _i1.SmartFake
    implements _i4.SearchRestaurantResult {
  _FakeSearchRestaurantResult_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePostReviewResult_3 extends _i1.SmartFake
    implements _i5.PostReviewResult {
  _FakePostReviewResult_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_5 extends _i1.SmartFake
    implements _i6.StreamedResponse {
  _FakeStreamedResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i7.ApiService {
  @override
  set client(_i6.Client? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<_i2.RestaurantsResult> getListRestaurant() => (super.noSuchMethod(
        Invocation.method(
          #getListRestaurant,
          [],
        ),
        returnValue:
            _i8.Future<_i2.RestaurantsResult>.value(_FakeRestaurantsResult_0(
          this,
          Invocation.method(
            #getListRestaurant,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i2.RestaurantsResult>.value(_FakeRestaurantsResult_0(
          this,
          Invocation.method(
            #getListRestaurant,
            [],
          ),
        )),
      ) as _i8.Future<_i2.RestaurantsResult>);
  @override
  _i8.Future<_i3.DetailRestaurantResult> getDetailRestaurant(
          {required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailRestaurant,
          [],
          {#id: id},
        ),
        returnValue: _i8.Future<_i3.DetailRestaurantResult>.value(
            _FakeDetailRestaurantResult_1(
          this,
          Invocation.method(
            #getDetailRestaurant,
            [],
            {#id: id},
          ),
        )),
        returnValueForMissingStub: _i8.Future<_i3.DetailRestaurantResult>.value(
            _FakeDetailRestaurantResult_1(
          this,
          Invocation.method(
            #getDetailRestaurant,
            [],
            {#id: id},
          ),
        )),
      ) as _i8.Future<_i3.DetailRestaurantResult>);
  @override
  _i8.Future<_i4.SearchRestaurantResult> getSearchRestaurant(
          {required String? query}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSearchRestaurant,
          [],
          {#query: query},
        ),
        returnValue: _i8.Future<_i4.SearchRestaurantResult>.value(
            _FakeSearchRestaurantResult_2(
          this,
          Invocation.method(
            #getSearchRestaurant,
            [],
            {#query: query},
          ),
        )),
        returnValueForMissingStub: _i8.Future<_i4.SearchRestaurantResult>.value(
            _FakeSearchRestaurantResult_2(
          this,
          Invocation.method(
            #getSearchRestaurant,
            [],
            {#query: query},
          ),
        )),
      ) as _i8.Future<_i4.SearchRestaurantResult>);
  @override
  _i8.Future<_i5.PostReviewResult> postReview({
    required String? id,
    required String? name,
    required String? review,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postReview,
          [],
          {
            #id: id,
            #name: name,
            #review: review,
          },
        ),
        returnValue:
            _i8.Future<_i5.PostReviewResult>.value(_FakePostReviewResult_3(
          this,
          Invocation.method(
            #postReview,
            [],
            {
              #id: id,
              #name: name,
              #review: review,
            },
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i5.PostReviewResult>.value(_FakePostReviewResult_3(
          this,
          Invocation.method(
            #postReview,
            [],
            {
              #id: id,
              #name: name,
              #review: review,
            },
          ),
        )),
      ) as _i8.Future<_i5.PostReviewResult>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i6.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i9.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);
  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(''),
      ) as _i8.Future<String>);
  @override
  _i8.Future<_i10.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i10.Uint8List>.value(_i10.Uint8List(0)),
      ) as _i8.Future<_i10.Uint8List>);
  @override
  _i8.Future<_i6.StreamedResponse> send(_i6.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i6.StreamedResponse>.value(_FakeStreamedResponse_5(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i6.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
