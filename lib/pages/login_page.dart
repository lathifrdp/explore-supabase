import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_quickstart/model/pengguna.dart';
import 'package:supabase_quickstart/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  List<Pengguna> listPengguna = <Pengguna>[];

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      // await supabase.auth.signInWithPassword(
      //   email: _emailController.text,
      //   password: _passwordController.text,
      // );
      _emailController.text = "tes3695@gmail.com";
      _passwordController.text = "tes12345";
      List data = await supabase
          .from('pengguna')
          .select('id, username, password, email, created_at');
      listPengguna = data.map((e) => Pengguna.fromJson(e)).toList();

      for (var i in listPengguna) {
        if (i.email == _emailController.text &&
            i.password == _passwordController.text) {
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/chat', (route) => false);
          }
        }
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (_) {
      context.showErrorSnackBar(message: "Email atau password salah");
      //context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        padding: formPadding,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          formSpacer,
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          formSpacer,
          ElevatedButton(
            onPressed: _isLoading ? null : _signIn,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
