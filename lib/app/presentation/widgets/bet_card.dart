import 'package:flutter/material.dart';

class BetCard extends StatefulWidget {
  const BetCard({super.key});

  @override
  State<BetCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<BetCard> {
  String? data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      child: SizedBox(height: 20),
    );
  }
}
