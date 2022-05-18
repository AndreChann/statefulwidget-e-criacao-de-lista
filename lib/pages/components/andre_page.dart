import 'package:flutter/material.dart';
import '../model/marca_modelo_model.dart';
import '../utils/paddings.dart';
import 'andre_card.dart';

class StandardPage extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton fab;

  StandardPage({
    required this.title,
    required this.body,
    required this.fab,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: fab,
      body: Padding(
        padding: EdgeInsets.only(
          left: AppPaddings.borderPadding,
          right: AppPaddings.borderPadding,
          top: AppPaddings.topPadding,
        ),
        child: SingleChildScrollView(child: body),
      ),
    );
  }
}
