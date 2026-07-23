import 'package:flutter/material.dart';
import '../../../../config/theme/app_text_styles.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
      ),
      body: Center(
        child: Text('Documents Screen', style: AppTextStyles.heading3),
      ),
    );
  }
}
