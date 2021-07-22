import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:partnerin/cubit/profile/profile_cubit.dart';
import 'package:partnerin/model/profile/change_password_request.dart';

import '../../constants.dart';

class UbahPassword extends StatefulWidget {
  UbahPassword({Key? key}) : super(key: key);

  @override
  _UbahPasswordState createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObscure = true;
  bool _isNewPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            Get.showSnackbar(
              GetBar(
                message: "Password Changed Successfully",
                duration: Duration(seconds: 4),
                isDismissible: true,
                margin: EdgeInsets.all(8.0),
                borderRadius: 10,
              ),
            );
            _passwordController.clear();
            _newPasswordController.clear();
            _newPasswordConfirmController.clear();
          } else if (state is ProfileUpdateError) {
            Get.showSnackbar(
              GetBar(
                message: state.errorMessage,
                duration: Duration(seconds: 4),
                isDismissible: true,
                margin: EdgeInsets.all(8.0),
                borderRadius: 10,
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Constants.PARTNERIN_TEAL.withOpacity(0.5),
            title: Text(
              'Ubah Kata Sandi',
              style: Theme.of(context).textTheme.headline3,
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios),
              tooltip: 'Back',
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isPasswordObscure,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: Theme.of(context).textTheme.headline1,
                        labelText: 'Password lama',
                        suffix: InkWell(
                          radius: 25,
                          borderRadius: BorderRadius.circular(25),
                          splashColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => setState(
                              () => _isPasswordObscure = !_isPasswordObscure),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Icon(
                              _isPasswordObscure
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password lama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 9),
                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: _isNewPasswordObscure,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: Theme.of(context).textTheme.headline1,
                        labelText: 'Password baru',
                        suffix: InkWell(
                          radius: 25,
                          borderRadius: BorderRadius.circular(25),
                          splashColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => setState(() =>
                              _isNewPasswordObscure = !_isNewPasswordObscure),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Icon(
                              _isNewPasswordObscure
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password baru tidak boleh kosong';
                        } else if (value.length < 6) {
                          return 'Password tidak boleh kurang dari 6 karakter';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 9),
                    TextFormField(
                      controller: _newPasswordConfirmController,
                      obscureText: _isConfirmPasswordObscure,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: Theme.of(context).textTheme.headline1,
                        labelText: 'Konfirmasi password',
                        suffix: InkWell(
                          radius: 25,
                          borderRadius: BorderRadius.circular(25),
                          splashColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => setState(() =>
                              _isConfirmPasswordObscure =
                                  !_isConfirmPasswordObscure),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Icon(
                              _isConfirmPasswordObscure
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
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Constants.PARTNERIN_TEAL,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ChangePasswordRequest changePasswordRequest =
                              ChangePasswordRequest(
                            currentPassword: _passwordController.text,
                            newPassword: _newPasswordController.text,
                          );
                          context.read<ProfileCubit>().changePassword(
                              GetStorage().read("token"),
                              changePasswordRequest);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 42,
                        child: Center(
                          child: Text(
                            'Simpan kata sandi',
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
        ),
      ),
    );
  }
}
