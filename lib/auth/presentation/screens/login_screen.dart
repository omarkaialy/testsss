import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';
import '../widgets/main_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          BotToast.showLoading(clickClose: false);
        } else if (state is AuthSuccess) {
          BotToast.closeAllLoading();
          BotToast.showNotification(
            title: (cancelFunc) => const Text('Auth Sucess'),
          );
        } else {
          BotToast.closeAllLoading();
          BotToast.showNotification(
              title: (cancelFunc) => const Text('Try Again'));
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Center(
                      child: Text(
                    'Welcome back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 18),
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(height: 170, child: Image.asset('assets/login.png')),
                  const SizedBox(
                    height: 50,
                  ),
                  MainTextFormField(
                    controller: emailController,
                    fillColor: Colors.white,
                    label: 'Enter Your E-mail',
                  ),
                  const SizedBox(height: 30),
                  MainTextFormField(
                    controller: passwordController,
                    fillColor: Colors.white,
                    isPassowrd: true,
                    label: 'Enter Your Password',
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                          color: Color(0xff50C2C9),
                          fontFamily: 'Poppins',
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff50C2C9),
                          minimumSize: const Size(0, 55)),
                      onPressed: () {
                        context.read<AuthBloc>().add(LoginEvent(
                            password: passwordController.text,
                            email: emailController.text));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont\'t Have Account?'),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: const Color(0xff50C2C9),
                              minimumSize: const Size(0, 55)),
                          onPressed: () {},
                          child: const Text(
                            'Sign Up',
                          )),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  )
                ],
              ),
            ),
            Image.asset('assets/circles.png')
          ],
        ),
      ),
    );
  }
}
