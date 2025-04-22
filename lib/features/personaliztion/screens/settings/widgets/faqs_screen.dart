import 'package:flutter/material.dart';
import 'package:e_commerce_user/common/widgets/appbar/appbar.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqList = [
      {
        "question": "How can I track my order?",
        "answer": "Go to Settings > My Orders to track your placed orders."
      },
      {
        "question": "What is your return policy?",
        "answer": "You can return products within 7 days of delivery."
      },
      {
        "question": "How do I cancel an order?",
        "answer":
            "You can cancel your order before it's shipped from the Orders page."
      },
      {
        "question": "What payment methods do you accept?",
        "answer": "We accept UPI, Credit/Debit Cards, and Net Banking."
      },
    ];

    return Scaffold(
      appBar: CustomAppbar(
          title: Text(
        "FAQs",
        style: Theme.of(context).textTheme.headlineMedium,
      )),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final faq = faqList[index];
          return ExpansionTile(
            title: Text(faq['question']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faq['answer']!),
              )
            ],
          );
        },
      ),
    );
  }
}
