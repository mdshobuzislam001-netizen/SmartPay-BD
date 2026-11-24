
import 'package:flutter/material.dart';

void main() {
  runApp(const SmartPayApp());
}

class SmartPayApp extends StatelessWidget {
  const SmartPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartPay BD',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087A45),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7F6),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int balance = 0;
  int selectedIndex = 0;

  final List<Map<String, dynamic>> services = [
    {'name': 'Send Money', 'icon': Icons.send},
    {'name': 'Add Money', 'icon': Icons.account_balance_wallet},
    {'name': 'Mobile Recharge', 'icon': Icons.phone_android},
    {'name': 'Payment', 'icon': Icons.payment},
    {'name': 'Transaction', 'icon': Icons.history},
    {'name': 'My Profile', 'icon': Icons.person},
  ];

  void showService(String name) {
    String message;

    switch (name) {
      case 'Send Money':
        message = 'Send Money service is coming soon.';
        break;
      case 'Add Money':
        message = 'Add Money service is coming soon.';
        break;
      case 'Mobile Recharge':
        message = 'Mobile Recharge service is coming soon.';
        break;
      case 'Payment':
        message = 'Payment service is coming soon.';
        break;
      case 'Transaction':
        message = 'No transactions available.';
        break;
      default:
        message = 'Welcome to SmartPay BD!';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(name),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget serviceCard(String name, IconData icon) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => showService(name),
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 34,
              color: const Color(0xFF087A45),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF087A45),
        foregroundColor: Colors.white,
        title: const Text(
          'SmartPay BD',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showService('Notifications');
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF087A45),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Available Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '৳ $balance',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'SmartPay BD Wallet',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Our Services',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.35,
              ),
              itemBuilder: (context, index) {
                return serviceCard(
                  services[index]['name'] as String,
                  services[index]['icon'] as IconData,
                );
              },
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.security,
                    color: Color(0xFF087A45),
                    size: 35,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Secure Digital Payment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome to SmartPay BD',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Center(
              child: Text(
                'SmartPay BD © 2026',
                style: TextStyle(color: Colors.grey),
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: const Color(0xFF087A45),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          if (index == 1) {
            showService('Transaction');
          } else if (index == 2) {
            showService('My Profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
