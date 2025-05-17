import 'package:assessment_app/models/quote.dart';
import 'package:assessment_app/services/quote_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quote_provider.g.dart';

@riverpod
Future<Quote> quoteNotifier(Ref ref) async {
  final Quote quote = await QuoteService().getQuoteService();

  return quote;
}
