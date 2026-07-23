import 'package:flutter/material.dart';
import '../../../../config/theme/app_text_styles.dart';

class AIInsightsScreen extends StatefulWidget {
  const AIInsightsScreen({Key? key}) : super(key: key);

  @override
  State<AIInsightsScreen> createState() => _AIInsightsScreenState();
}

class _AIInsightsScreenState extends State<AIInsightsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Insights'),
      ),
      body: Center(
        child: Text('AI Insights Screen', style: AppTextStyles.heading3),
      ),
    );
  }
}
