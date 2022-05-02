import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import 'package:aniyay/data/models/graphql_request_model.dart';

class ApiProvider {
  static final Uri _baseUri = Uri.parse('https://graphql.anilist.co');

  Future<String> makeGraphQLRequest({
    required GraphQLRequestModel request,
  }) async {
    final response = await post(
      _baseUri,
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.toString()},
      body: json.encode(request.toJson()),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {}
    return response.body;
  }
}
