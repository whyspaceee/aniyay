import 'package:aniyay/data/models/graphql_request_model.dart';
import 'package:aniyay/data/models/main_menu_model.dart';
import 'package:aniyay/data/providers/api_provider.dart';
import 'dart:convert';

import 'package:aniyay/utils/formatquery.dart';
import 'package:aniyay/utils/graphql_constants.dart';

class MainMenuRepository {
  final ApiProvider _apiProvider;

  MainMenuRepository(this._apiProvider);

  Future<MainMenuModelComplete> parseFetchMainMenu(String type) async {
    GraphQLRequestModel modelPopular = GraphQLRequestModel(
      query: formatQuery(fetchHomepageQuery),
      variables: {
        'page': 1,
        'perPage': 25,
        'sort': 'POPULARITY_DESC',
        'type': type
      },
    );
    GraphQLRequestModel modelTrending = GraphQLRequestModel(
      query: formatQuery(fetchHomepageQuery),
      variables: {
        'page': 1,
        'perPage': 25,
        'sort': 'TRENDING_DESC',
        'type': type
      },
    );
    GraphQLRequestModel modelScore = GraphQLRequestModel(
      query: formatQuery(fetchHomepageQuery),
      variables: {'page': 1, 'perPage': 25, 'sort': 'SCORE_DESC', 'type': type},
    );
    final rawPopular =
        await _apiProvider.makeGraphQLRequest(request: modelPopular);
    final responsePopular = json.decode(rawPopular) as Map<String, dynamic>;

    final rawTrending =
        await _apiProvider.makeGraphQLRequest(request: modelTrending);
    final responseTrending = json.decode(rawTrending) as Map<String, dynamic>;

    final rawScore = await _apiProvider.makeGraphQLRequest(request: modelScore);
    final responseScore = json.decode(rawScore) as Map<String, dynamic>;

    return MainMenuModelComplete(
        popularModel: parseToModel(responsePopular),
        trendingModel: parseToModel(responseTrending),
        scoreModel: parseToModel(responseScore));
  }

  List<MainMenuModel> parseToModel(Map<String, dynamic> response) {
    return (response['data']['Page']['media'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .where((element) =>
            element['coverImage']['large'] != null &&
            element['meanScore'] != null)
        .map((element) => MainMenuModel.fromJson(element))
        .toList();
  }
}
