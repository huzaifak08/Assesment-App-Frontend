import 'package:assessment_app/clients/api_client.dart';
import 'package:assessment_app/helpers/endpoints.dart';
import 'package:assessment_app/helpers/sp_helper.dart';
import 'package:assessment_app/models/quote.dart';
import 'package:dio/dio.dart';

class QuoteService {
  Future<Quote> getQuoteService() async {
    try {
      String baseUrl = Endpoints.BASE_URL;
      final token = await SpHelper().getAuthToken();

      final response = await DioApiClient.getRequest(
        "$baseUrl/quote/get-random-quote",
        options: Options(headers: {"Auth-Token": token}),
      );

      if (response.statusCode == 200) {
        Quote quote = Quote.fromMap(response.data['data']);

        return quote;
      } else {
        throw Exception("Failed to fetch quote. Status: ${response.status}");
      }
    } catch (err) {
      throw Exception("Exception: $err");
    }
  }
}
