import 'package:flutter/material.dart';

class SuggestScreen extends StatefulWidget {
  const SuggestScreen({super.key});

  @override
  State<SuggestScreen> createState() => _SuggestScreenState();
}

class _SuggestScreenState extends State<SuggestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggest Screen'),
      ),
      body: const Center(
        child: Text('Suggest Screen'),
      ),
    );
  }
}