import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurants_result.dart';
import 'package:http/http.dart' as http;

@GenerateNiceMocks([MockSpec<ApiService>()])
import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("Api Service & Json Parsing Test", () {
    
    RestaurantsResult restaurantsResult = RestaurantsResult(
        error: false,
        message:"success",
        count: 1,
        restaurants: [
          Restaurant(
            id: "rqdv5juczeskfw1e867",
            name: "Melting Pot",
            description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
            pictureId: "14",
            city: "Medan",
            rating: 4.2
          )
        ]);
    
    Map<String, dynamic> restaurantsResultJson = restaurantsResult.toJson();

    test("Api Service get list restaurant success", () async {
      var apiService = MockApiService();

      when(apiService.getListRestaurant()).thenAnswer((realInvocation) async {
        return restaurantsResult;
      });

      var result = await apiService.getListRestaurant();

      verify(apiService.getListRestaurant());
      expect(result, restaurantsResult);
    });

    test("Api Service get list restaurant throws exception", () async {
      var apiService = MockApiService();

      when(apiService.getListRestaurant()).thenAnswer((realInvocation) {
        throw Exception();
      });

      expect(() async {
        apiService.getListRestaurant();
      }, throwsException);
      verify(apiService.getListRestaurant());
    });

    test("Json parsed correctly when api endpoint response success", () async {
      var mockClient = MockClient();
      var apiService = ApiService(client: mockClient);

      when(mockClient.get(Uri.parse("${ApiService.baseUrl}list"))).thenAnswer((realInvocation) async {
        return http.Response(json.encode(restaurantsResultJson), 200);
      });

      expect(await apiService.getListRestaurant(), isA<RestaurantsResult>());
    });
    
    test("Exception throwed when api endpoint response with error", () async {
      var mockClient = MockClient();
      var apiService = ApiService(client: mockClient);

      when(mockClient.get(Uri.parse("${ApiService.baseUrl}list"))).thenAnswer((realInvocation) async {
        return http.Response("{}", 404);
      });

      expect(apiService.getListRestaurant(), throwsException);
    });
  });
}
