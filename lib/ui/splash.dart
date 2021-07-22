import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:partnerin/cubit/auth/auth_cubit.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..loadFromLocal(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLocalLoadSuccess) {
            if (state.role == 1)
              Timer(
                Duration(seconds: 2),
                () => Get.offNamed('/'),
              );
            else
              Timer(
                Duration(seconds: 2),
                () => Get.offNamed('/owner-home'),
              );
          } else {
            Timer(
              Duration(seconds: 2),
              () => Get.offNamed('/login'),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Image.asset('assets/images/partnerin-logo.png'),
          ),
        ),
      ),
    );
  }
}
