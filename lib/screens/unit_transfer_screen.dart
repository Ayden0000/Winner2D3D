import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:winner_2d/consts/amount.dart';
import 'package:winner_2d/services/utils.dart';
import 'package:winner_2d/widgets/dark_mode_icon.dart';
import 'package:winner_2d/widgets/normal_button.dart';
import 'package:winner_2d/widgets/profile_card.dart';

enum UserType { SuperAdmin, Admin, User }

class UnitTransferScreen extends StatefulWidget {
  const UnitTransferScreen({super.key});

  @override
  State<UnitTransferScreen> createState() =>
      _UnitTransferScreenState();
}

class _UnitTransferScreenState extends State<UnitTransferScreen> {
  final TextEditingController _amountController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passToggle = false;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/logo.png',
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Winner 2D3D',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        actions: [DarkModeIcon()],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ProfileCard(),
              const SizedBox(height: 50),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    // Inner Column
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: color),
                          color:
                              Theme.of(
                                context,
                              ).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          value: _selectedValue,
                          padding: const EdgeInsets.only(left: 20),
                          isExpanded: true,
                          underline: Container(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: color,
                          ),
                          style: TextStyle(
                            color: color,
                            fontSize: 16,
                          ),
                          hint: Text(
                            "Select a user type",
                            style: TextStyle(
                              color: color.withOpacity(0.7),
                            ),
                          ),
                          items:
                              UserType.values.map((type) {
                                return DropdownMenuItem(
                                  value:
                                      type.toString().split('.').last,
                                  child: Text(
                                    type.toString().split('.').last,
                                  ),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _amountController,
                                  style: TextStyle(color: color),
                                  cursorColor: color,
                                  decoration: InputDecoration(
                                    labelText: 'Amount',
                                    labelStyle: TextStyle(
                                      color: color,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.attach_money,
                                      color: color,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color,
                                      ),
                                      borderRadius:
                                          const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                    ),
                                  ),
                                  // validator:
                                  //     (value) => Validators.required(
                                  //       value,
                                  //       'Username',
                                  //     ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _passwordController,
                                  style: TextStyle(color: color),
                                  cursorColor: color,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color: color,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: color,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _passToggle = !_passToggle;
                                        });
                                      },
                                      child: Icon(
                                        _passToggle
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: color,
                                        size: 18,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color,
                                      ),
                                      borderRadius:
                                          const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: color,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                    ),
                                  ),
                                  // validator:
                                  //     (value) => Validators.required(
                                  //       value,
                                  //       'Password',
                                  //     ),
                                  obscureText: !_passToggle,
                                ),
                                const SizedBox(height: 40),
                                NormalButton(
                                  title: 'Transfer',
                                  icon: Icons.attach_money,
                                  onPressed: () async {
                                    int amountInt = int.parse(
                                      _amountController.text,
                                    );
                                    if (_amountController
                                        .text
                                        .isEmpty) {
                                      return;
                                    }
                                    if (_passwordController
                                        .text
                                        .isEmpty) {
                                      return;
                                    }
                                    if (amountInt > amount) {
                                      await QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.error,
                                        title: 'Insufficient amount',
                                        text:
                                            'You don\'t have enough funds to make this transfer.',
                                        confirmBtnColor: Colors.red,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
