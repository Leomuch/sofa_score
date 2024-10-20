import 'package:flutter/material.dart';
import 'package:sofa_score/pages/home_page.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isObscured = true;
  bool _showPassword = false;
  bool _agreedToTerms = false;
  bool _autoLogin = false;
  var gender = "";
  DateTime? _selectedDate;
  String? _country;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Add a listener to update the state when the tab changes
    _tabController.addListener(() {
      setState(() {}); // Call setState to trigger a rebuild
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sofa Score'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Text(
                _tabController.index == 0
                    ? 'Welcome Back'
                    : "Let's Get Started",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _tabController.index == 0
                    ? 'Please login with your account'
                    : "Please create your account",
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 6),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: "Sign In"),
                  Tab(text: "Sign Up"),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // sign in
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email Or Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: _isObscured,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Checkbox(
                    value: _showPassword,
                    onChanged: (bool? value) {
                      setState(() {
                        _showPassword = value ?? false;
                        _isObscured = !_showPassword;
                      });
                    },
                  ),
                  title: const Text('Show Password'),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: const Text('Remember Me'),
                  trailing: Switch(
                    value: _autoLogin,
                    onChanged: (bool value) {
                      setState(() {
                        _autoLogin = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text('Login'),
                  ),
                )
              ],
            ),
          ),
          // sign up
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email Or Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Tanggal Lahir"),
                      TextButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          _selectedDate == null
                              ? 'Pilih Tanggal'
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Gender"),
                const SizedBox(height: 5),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Pria'),
                  leading: Radio(
                    value: 'Pria',
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Wanita'),
                  leading: Radio(
                    value: 'Wanita',
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: _isObscured,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Checkbox(
                    value: _showPassword,
                    onChanged: (bool? value) {
                      setState(() {
                        _showPassword = value ?? false;
                        _isObscured = !_showPassword;
                      });
                    },
                  ),
                  title: const Text('Show Password'),
                ),
                const Text("Pilih Negara"),
                DropdownButtonFormField<String>(
                  value: _country,
                  items: <String>[
                    'Indonesia',
                    'Malaysia',
                    'Singapore',
                    'Thailand'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  hint: const Text('Select Country'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _country = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('I agree to the terms and conditions'),
                  leading: Checkbox(
                    value: _agreedToTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        _agreedToTerms = value ?? false;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text('Register'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
