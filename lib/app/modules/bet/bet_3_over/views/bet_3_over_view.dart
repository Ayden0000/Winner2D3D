import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bet_3_over_controller.dart';

class Bet3OverView extends GetView<Bet3OverController> {
  const Bet3OverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bet3OverView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Bet3OverView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
