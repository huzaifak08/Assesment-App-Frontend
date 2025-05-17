import 'package:assessment_app/models/quote.dart';
import 'package:assessment_app/services/quote_service.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  Quote? _quote;

  @override
  void initState() {
    // config();
    super.initState();
  }

  void config() async {
    Quote quote = await QuoteService().getQuoteService();
    _quote = quote;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                Quote quote = await QuoteService().getQuoteService();

                print("Quote: ${quote}");
              },
              child: Text("Click"),
            ),
          ],
        ),
      ),
    );
  }
}
