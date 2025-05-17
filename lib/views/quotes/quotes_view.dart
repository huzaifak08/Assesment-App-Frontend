import 'package:assessment_app/helpers/colors.dart';
import 'package:assessment_app/providers/quote_provider/quote_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shimmer/shimmer.dart';

class QuotesView extends ConsumerWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quote = ref.watch(quoteNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Headline
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 16.0,
              ),
              child: Text(
                'Quote of the Day',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.orange[800],
                  shadows: [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.orangeAccent.withOpacity(0.4),
                      offset: Offset(0, 4),
                    ),
                  ],
                  fontFamily: 'Serif',
                ),
              ),
            ),

            // Quote Container
            quote.when(
              data: (quoteData) {
                return Expanded(
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(minWidth: 200, maxWidth: 400),
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.25),
                            blurRadius: 24,
                            offset: Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.format_quote,
                            color: AppColors.primaryColor,
                            size: 40,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '“${quoteData.quote}”',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              color: Colors.blueGrey[900],
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '- ${quoteData.author}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              error: (error, stacktrack) => Text('Error'),
              loading:
                  () => Expanded(
                    child: Center(
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 200,
                          maxWidth: 400,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 32,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor.withOpacity(0.25),
                              blurRadius: 24,
                              offset: Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.format_quote,
                                color: Colors.grey[300],
                                size: 40,
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 24,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 24,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 24,
                                width: 200,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 24),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 20,
                                  width: 100,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
