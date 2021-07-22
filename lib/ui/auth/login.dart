import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:partnerin/constants.dart';
import 'package:partnerin/cubit/auth/auth_cubit.dart';
import 'package:partnerin/model/auth/login_request.dart';
import 'package:partnerin/widgets/loading_button.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
            } else if (state is AuthError) {
              Get.defaultDialog(
                title: 'Auth Error',
                content: Text(state.errorMessage),
              );
            } else if (state is AuthLoginSuccess) {
              print('Saving data to local...');
              context.read<AuthCubit>().saveToLocal(state.loginResult!);
            } else if (state is AuthLocalSaved) {
              print('Data saved to local');
              if (state.role == 1)
                Get.offAllNamed('/');
              else
                Get.offAllNamed('/owner-home');
            }
          },
          builder: (context, state) => Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/partnerin-bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/partnerin-logo.png'),
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.75),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 15.0,
                  ),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: Theme.of(context).textTheme.headline1,
                              hintText: 'Email',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email tidak boleh kosong';
                              } else if (!value.contains('@')) {
                                return 'Format email salah';
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
                              hintStyle: Theme.of(context).textTheme.headline1,
                              hintText: 'Password',
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
                          TextButton(
                            onPressed: () => Get.toNamed('/reset-password'),
                            child: Text(
                              'Lupa password?',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextButton(
                      onPressed: () =>
                          state is AuthLoading ? '' : Get.toNamed('/register'),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tapTargetSize: MaterialTapTargetSize.padded,
                      ),
                      child: Text(
                        'Daftar',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ],
                ),
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
                            final _requestData = LoginRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            context.read<AuthCubit>().login(_requestData);
                          }
                        },
                        child: Container(
                          width: 288,
                          height: 42,
                          child: Center(
                            child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
