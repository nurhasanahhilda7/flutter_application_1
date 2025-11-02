import 'dart:ui';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  void _login() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            tooltip: 'Pusat Bantuan',
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // 🔹 Background image
          Positioned.fill(
            child: Image.asset(
              'assets/image/photo-1506744038136-46273834b3fb.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Efek gelap tipis biar tulisan tetap kebaca
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ),

          // 🔹 Form Login transparan dengan efek blur
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const FlutterLogo(size: 80),
                          const SizedBox(height: 16),
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailCtrl,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.email, color: Colors.white),
                              labelText: 'Email',
                              labelStyle:
                                  const TextStyle(color: Colors.white70),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white.withValues(alpha: 0.5)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _passCtrl,
                            obscureText: _obscure,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.white),
                              labelText: 'Password',
                              labelStyle:
                                  const TextStyle(color: Colors.white70),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white.withValues(alpha: 0.5)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () =>
                                    setState(() => _obscure = !_obscure),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Lupa Email / Password?',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text('Masuk'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
