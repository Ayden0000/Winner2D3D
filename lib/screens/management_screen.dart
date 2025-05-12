import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:winner_2d/services/utils.dart';
import 'package:winner_2d/widgets/dark_mode_icon.dart';
import 'package:winner_2d/widgets/normal_button.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  final TextEditingController _amountController =
      TextEditingController();
  final TextEditingController _numberController =
      TextEditingController();
  final Set<int> _selectedNumbers = {};

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    final numbers = List.generate(
      100,
      (i) => i.toString().padLeft(2, '0'),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
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
      body: Column(
        children: [
          Expanded(
            child: ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedNumbers.contains(index);

                  return InkWell(
                    onLongPress: () {
                      setState(() {
                        _selectedNumbers.add(index);

                        var rNumber =
                            _selectedNumbers.last.toString();
                        if (rNumber.length == 1) {
                          rNumber = '0' + rNumber;
                        }

                        final r = rNumber[1] + rNumber[0];
                        final rIndex = int.parse(r);
                        _selectedNumbers.add(rIndex);
                      });
                    },
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedNumbers.remove(index);
                        } else {
                          _selectedNumbers.add(index);
                        }
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color:
                          isSelected
                              ? Theme.of(
                                context,
                              ).colorScheme.secondary.withOpacity(0.3)
                              : Theme.of(
                                context,
                              ).colorScheme.secondary,
                      child: Center(
                        child: Text(
                          numbers[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          controller: _numberController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Number',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          if (_numberController.text.isEmpty) {
                            return;
                          }
                          if (_numberController.text.length != 2) {
                            return;
                          }
                          setState(() {
                            final index = int.parse(
                              _numberController.text,
                            );
                            _selectedNumbers.add(index);

                            var rNumber = index.toString();
                            if (rNumber.length == 1) {
                              rNumber = '0' + rNumber;
                            }
                            final r = rNumber[1] + rNumber[0];
                            final rIndex = int.parse(r);
                            _selectedNumbers.add(rIndex);
                          });
                        },
                        child: Text(
                          'R',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: _amountController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Amount',
                            border: InputBorder.none,

                            prefixIcon: Icon(Icons.monetization_on),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                NormalButton(
                  title: 'Limit Amount',
                  icon: Icons.check,
                  onPressed: () async {
                    if (_selectedNumbers.isEmpty ||
                        _amountController.text.isEmpty) {
                      return;
                    }
                    await QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      text:
                          'Do you set limit betting amount for ${_selectedNumbers.join(', ')} to ${_amountController.text}?',
                      confirmBtnText: 'Yes',
                      cancelBtnText: 'No',
                      confirmBtnColor: Colors.green,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
