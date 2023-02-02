import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_quickstart/pages/account_page.dart';
import 'package:supabase_quickstart/pages/chat_page.dart';
import 'package:supabase_quickstart/pages/login_page.dart';
import 'package:supabase_quickstart/pages/register_page.dart';
import 'package:supabase_quickstart/pages/splash_page.dart';
import 'package:supabase_quickstart/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://timtpuwtodyagkyfqyut.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpbXRwdXd0b2R5YWdreWZxeXV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzUyNDE3NjUsImV4cCI6MTk5MDgxNzc2NX0.TQpeVAoDwMDorABvos3uSTEY-x9Ay4B7CnpQ73ALQFE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/account': (_) => const AccountPage(),
        '/register': (_) => const RegisterPage(),
        '/chat': (_) => const ChatPage(),
      },
    );
  }
}
