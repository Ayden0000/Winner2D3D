import 'package:flutter/material.dart';
import 'package:winner_2d/screens/unit_transfer_screen.dart';
import 'package:winner_2d/services/utils.dart';
import 'package:winner_2d/widgets/dark_mode_icon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final UserType userType = UserType.User;
  final TextEditingController _usernameController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passToggle = false;
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    var size = MediaQuery.of(context).size;

    void _onRegister() async {
      // if (_formKey.currentState!.validate()) {
      //   return;
      // }
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [DarkModeIcon()],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 150, height: 150),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Register into Winner 2D',
                        style: TextStyle(
                          color: color.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: color),
                        color:
                            Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedValue,
                        padding: EdgeInsets.only(left: 20),
                        isExpanded: true,
                        underline: Container(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                          color: color,
                        ),
                        style: TextStyle(color: color, fontSize: 16),
                        hint: const Text("Select a user type"),
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
                                controller: _usernameController,
                                style: TextStyle(color: color),
                                cursorColor: color,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(color: color),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: color,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: color,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: color,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: color,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
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
                                  labelStyle: TextStyle(color: color),
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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: color,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: color,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(
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
                              // Consumer<AuthProvider>(
                              //   builder: (
                              //     context,
                              //     authProvider,
                              //     child,
                              //   ) {
                              // return
                              Column(
                                children: [
                                  // if (authProvider.isLoading)
                                  //   CircularProgressIndicator(
                                  //     color: Colors.white,
                                  //   )
                                  // else
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                        foregroundColor: color,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(
                                                10,
                                              ),
                                        ),
                                      ),
                                      onPressed: () {
                                        _onRegister();
                                      },
                                      icon: Icon(
                                        Icons
                                            .app_registration_rounded,
                                      ),
                                      label: const Text(
                                        'Register',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // if (authProvider.errorMessage !=
                                  //     null)
                                  //   Text(
                                  //     authProvider.errorMessage!,
                                  //     style: TextStyle(
                                  //       color: Colors.red,
                                  //     ),
                                  //     textAlign: TextAlign.center,
                                  //   ),
                                ],
                                //   );
                                // },
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
    );
  }
}
