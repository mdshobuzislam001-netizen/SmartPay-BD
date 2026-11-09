import 'package:flutter/material.dart';

void main() => runApp(const SmartPayApp());

class SmartPayApp extends StatelessWidget {
  const SmartPayApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'SmartPay BD',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: const Color(0xFF087A45), useMaterial3: true),
    home: const HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showMessage(BuildContext context, String title, String message) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('ঠিক আছে'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('SmartPay BD'), backgroundColor: const Color(0xFF087A45), foregroundColor: Colors.white),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 20),
        const Icon(Icons.account_balance_wallet, size: 72, color: Color(0xFF087A45)),
        const SizedBox(height: 12),
        const Text('স্বাগতম SmartPay BD-তে', textAlign: TextAlign.center, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('অনুমোদিত ডিজিটাল পেমেন্ট সেবার প্ল্যাটফর্ম', textAlign: TextAlign.center),
        const SizedBox(height: 28),
        _MenuCard(icon: Icons.person_outline, title: 'সাধারণ ইউজার', subtitle: 'কাস্টমার অ্যাকাউন্ট', onTap: () => showMessage(context, 'সাধারণ ইউজার', 'পরবর্তী ধাপে নিরাপদ রেজিস্ট্রেশন ও লগইন যুক্ত হবে।')),
        _MenuCard(icon: Icons.storefront_outlined, title: 'এজেন্ট', subtitle: 'এজেন্ট আবেদন ও সেবা', onTap: () => showMessage(context, 'এজেন্ট', 'এজেন্ট আবেদন ও অনুমোদন ব্যবস্থা পরবর্তী ধাপে যুক্ত হবে।')),
        _MenuCard(icon: Icons.admin_panel_settings_outlined, title: 'অ্যাডমিন', subtitle: 'অ্যাডমিন ব্যবস্থাপনা', onTap: () => showMessage(context, 'অ্যাডমিন', 'সার্ভার-ভিত্তিক নিরাপদ অ্যাডমিন লগইন পরবর্তী ধাপে যুক্ত হবে।')),
        const SizedBox(height: 18),
        const Text('সতর্কতা: এই প্রাথমিক সংস্করণে বাস্তব টাকা জমা, উত্তোলন বা স্থানান্তর চালু নেই। লাইভ পেমেন্টের জন্য অনুমোদিত পেমেন্ট গেটওয়ে, নিরাপদ সার্ভার এবং প্রয়োজনীয় আইনগত অনুমোদন লাগবে।', style: TextStyle(fontSize: 12, color: Colors.black54), textAlign: TextAlign.center),
      ],
    ),
  );
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.icon, required this.title, required this.subtitle, required this.onTap});
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: Icon(icon, size: 30, color: const Color(0xFF087A45)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}
