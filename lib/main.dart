import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spiritual App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8C0944)),
        useMaterial3: true,
        scaffoldBackgroundColor:
            Colors.white, // Light background for better readability
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _phoneNumberController = TextEditingController();

  void _showPhoneNumberBottomSheet() {
    showModalBottomSheet<void>(
      useRootNavigator: true,

      context: context,
      backgroundColor: Colors.transparent, // Remove default background color
      builder: (BuildContext context) {
        return SafeArea(
          // Wrap with SafeArea to avoid content being obscured on some devices
          child: Container(
            decoration: BoxDecoration(
              color:
                  Theme.of(context).cardColor, // Use card color for background
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Text with a decorative pattern or image for Bhakti theme
                  Row(
                    children: [
                      // Image.asset(
                      //   'assets/images/om_symbol.png',
                      //   width: 40.0,
                      //   height: 40.0,
                      // ),
                      const SizedBox(width: 10.0),
                      Text(
                        'Find Your Inner Peace',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ), // Change border color on focus
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close bottom sheet
                      _showOtpScreen();
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ), // Rounded button corners
                    ),
                  ),
                  Container(
                    child: Image.asset('img2.png'),
                    height: MediaQuery.of(context).size.height * 0.2,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showOtpScreen() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent, // Remove default background color
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color:
                  Theme.of(context).cardColor, // Use card color for background
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter OTP',
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ), // Change border color on focus
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle submit button press (perform OTP validation)
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ), // Rounded button corners
                    ),
                  ),
                  Container(
                    child: Image.asset('img2.png'),
                    height: MediaQuery.of(context).size.height * 0.2,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          // Background image (replace with a calming, spiritual image)
          Image.asset(
            'img.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 100.0), // Adjust spacing as needed
                TextButton(
                  onPressed: _showPhoneNumberBottomSheet,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20.0,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    shape:
                        const StadiumBorder(), // Rounded button with top and bottom curves
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.8), // Semi-transparent button
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
