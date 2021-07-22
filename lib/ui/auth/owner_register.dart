import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:partnerin/cubit/auth/auth_cubit.dart';
import 'package:partnerin/model/auth/register_request.dart';
import 'package:partnerin/widgets/loading_button.dart';

import '../../constants.dart';

class OwnerRegister extends StatefulWidget {
  OwnerRegister({Key? key}) : super(key: key);

  @override
  _OwnerRegisterState createState() => _OwnerRegisterState();
}

class _OwnerRegisterState extends State<OwnerRegister> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => AuthCubit()..loadOwnerRegisStatus(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthOwnerStatusLoadSuccess) {
              if (state.isVerified)
                Get.offNamed('/owner-home');
              else
                Get.toNamed('/owner-info');
            } else if (state is AuthError) {
              Get.defaultDialog(
                title: 'Auth Error',
                content: Text(state.errorMessage),
              );
            } else if (state is AuthRegisterSuccess) {
              print('Saving data to local...');
              context.read<AuthCubit>().saveRegisToLocal(state.registerResult);
            } else if (state is AuthLocalSaved) {
              Get.toNamed('/owner-info');
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'Daftar',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        'Daftar untuk mencari mitra untuk bisnis anda',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 15.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelStyle:
                                    Theme.of(context).textTheme.headline1,
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email tidak boleh kosong';
                                } else if (!value.contains('@')) {
                                  return 'Format email tidak valid';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 9),
                            TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelStyle:
                                    Theme.of(context).textTheme.headline1,
                                labelText: 'Nama',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Nama tidak boleh kosong';
                                } else if (value.length < 3) {
                                  return 'Panjang nama tidak boleh kurang dari 3 karakter';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 9),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelStyle:
                                    Theme.of(context).textTheme.headline1,
                                labelText: 'Password',
                                suffix: InkWell(
                                  radius: 25,
                                  borderRadius: BorderRadius.circular(25),
                                  splashColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () =>
                                      setState(() => _isObscure = !_isObscure),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Icon(
                                      _isObscure
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                } else if (value.length < 6) {
                                  return 'Panjang password tidak boleh kurang dari 6 karakter';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 9),
                            TextFormField(
                              controller: _passwordConfirmController,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelStyle:
                                    Theme.of(context).textTheme.headline1,
                                labelText: 'Konfirmasi Password',
                                suffix: InkWell(
                                  radius: 25,
                                  borderRadius: BorderRadius.circular(25),
                                  splashColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () =>
                                      setState(() => _isObscure = !_isObscure),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    child: Icon(
                                      _isObscure
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Kolom ini tidak boleh kosong';
                                } else if (value != _passwordController.text) {
                                  return 'Password tidak sama!';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 12),
                            state is AuthLoading
                                ? LoadingButton()
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      primary: Constants.PARTNERIN_TEAL,
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        final registerRequest = RegisterRequest(
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          type: Get.parameters['type'],
                                        );
                                        context
                                            .read<AuthCubit>()
                                            .register(registerRequest);
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 42,
                                      child: Center(
                                        child: Text(
                                          'Daftar',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
