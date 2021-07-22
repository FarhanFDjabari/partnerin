import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partnerin/cubit/auth/auth_cubit.dart';
import 'package:partnerin/cubit/profile/profile_cubit.dart';
import 'package:partnerin/model/auth/logout_request.dart';
import 'package:partnerin/model/profile/user_request.dart';
import 'package:partnerin/widgets/loading_button.dart';

import '../../constants.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailController = TextEditingController();
  final _namaController = TextEditingController();
  final _fotoKtpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _tempatLahirController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  File? fotoKtp, fotoProfil;
  bool _isVerified = false;

  Future<File> getFotoKtp() async {
    var imagePicker = await _picker.getImage(source: ImageSource.camera);
    fotoKtp = File(imagePicker!.path);
    _fotoKtpController.text = fotoKtp!.path.split('/').last;
    return fotoKtp!;
  }

  Future<File> getFotoProfil() async {
    var imagePicker =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 70);
    fotoProfil = File(imagePicker!.path);
    return fotoProfil!;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) =>
              ProfileCubit()..getUser(GetStorage().read('token')),
        ),
      ],
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLogoutSuccess) {
            Get.offAllNamed('/splash');
          } else if (state is AuthError) {
            Get.defaultDialog(content: Text(state.errorMessage));
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Constants.PARTNERIN_TEAL.withOpacity(0.5),
            title: Text(
              'Profil',
              style: Theme.of(context).textTheme.headline3,
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios),
              tooltip: 'Back',
            ),
          ),
          backgroundColor: Colors.white,
          body: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileLoadError)
                Get.showSnackbar(
                  GetBar(
                    message: state.errorMessage,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    margin: EdgeInsets.all(8.0),
                    borderRadius: 10,
                  ),
                );
              else if (state is ProfileUpdateError)
                Get.showSnackbar(
                  GetBar(
                    message: state.errorMessage,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    margin: EdgeInsets.all(8.0),
                    borderRadius: 10,
                  ),
                );

              if (state is ProfileLoadSuccess) {
                _emailController.text = state.user.email ?? '';
                _namaController.text = state.user.name ?? '';
                _alamatController.text = state.user.address ?? '';
                _fotoKtpController.text = state.user.ktpUrl ?? '';
                _tanggalLahirController.text = state.user.dateOfBirth ?? '';
                _tempatLahirController.text = state.user.placeOfBirth ?? '';
                Get.showSnackbar(
                  GetBar(
                    message: "Profile Saved",
                    duration: Duration(seconds: 3),
                    isDismissible: true,
                    margin: EdgeInsets.all(8.0),
                    borderRadius: 10,
                  ),
                );
              } else if (state is ProfilePhotoUpdateSuccess) {
                context
                    .read<ProfileCubit>()
                    .getUser(GetStorage().read("token"));
                Get.showSnackbar(
                  GetBar(
                    message: "Photo Profile Updated",
                    duration: Duration(seconds: 3),
                    isDismissible: true,
                    margin: EdgeInsets.all(8.0),
                    borderRadius: 10,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is ProfileLoadSuccess)
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 12),
                                width: 138,
                                height: 138,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 75,
                                      backgroundColor: Constants.PARTNERIN_TEAL,
                                      backgroundImage:
                                          state.user.profilePhotoUrl != null
                                              ? NetworkImage(
                                                  Constants.MEDIA_BASE_URL +
                                                      state.user
                                                          .profilePhotoUrl!)
                                              : NetworkImage(Constants
                                                  .PROFILE_PIC_PLACEHOLDER),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 10,
                                      right: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            onTap: () async {
                                              await getFotoProfil().then(
                                                  (value) => context
                                                      .read<ProfileCubit>()
                                                      .uploadProfilePhoto(
                                                        GetStorage()
                                                            .read("token"),
                                                        value,
                                                      ));
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                              child: Center(
                                                child: Icon(Icons.edit),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            onTap: () {},
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red,
                                              ),
                                              child: Center(
                                                child: Icon(Icons.delete),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 9),
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
                                validator: (value) {},
                              ),
                              SizedBox(height: 9),
                              TextFormField(
                                controller: _namaController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelStyle:
                                      Theme.of(context).textTheme.headline1,
                                  labelText: 'Nama',
                                ),
                                validator: (value) {},
                              ),
                              SizedBox(height: 9),
                              if (!_isVerified)
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 193,
                                          child: TextFormField(
                                            controller: _fotoKtpController,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
                                              hintText: 'Pilih file',
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
                                              labelText: 'Foto KTP',
                                            ),
                                            validator: (value) {},
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            await getFotoKtp().then(
                                              (value) => context
                                                  .read<ProfileCubit>()
                                                  .uploadPhotoKtp(
                                                    GetStorage().read("token"),
                                                    value,
                                                  ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            primary: Constants.PARTNERIN_TEAL,
                                          ),
                                          child: Container(
                                            width: 97,
                                            height: 60,
                                            child: Center(
                                              child: Text(
                                                'Unggah',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    TextFormField(
                                      controller: _alamatController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                        labelText: 'Alamat',
                                      ),
                                      validator: (value) {},
                                    ),
                                    SizedBox(height: 9),
                                    TextFormField(
                                      controller: _tanggalLahirController,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                        labelText: 'Tanggal lahir',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                        hintText: 'dd/MM/yyyy',
                                      ),
                                      validator: (value) {},
                                    ),
                                    SizedBox(height: 9),
                                    TextFormField(
                                      controller: _tempatLahirController,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                        labelText: 'Tempat lahir',
                                      ),
                                      validator: (value) {},
                                    ),
                                  ],
                                ),
                              SizedBox(height: 15),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: Constants.PARTNERIN_TEAL),
                                  ),
                                  primary: Colors.white,
                                  shadowColor: Colors.grey.withOpacity(0.2),
                                ),
                                onPressed: () =>
                                    Get.toNamed('/change-password'),
                                child: Container(
                                  width: double.infinity,
                                  height: 42,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      'Ubah kata sandi',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 3),
                              state is AuthLoading
                                  ? LoadingButton()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        primary: Constants.PARTNERIN_TEAL,
                                      ),
                                      onPressed: () {
                                        UserRequest userRequest = UserRequest(
                                          name: _namaController.text,
                                          email: _emailController.text,
                                          address: _alamatController.text,
                                          dateOfBirth:
                                              _tanggalLahirController.text,
                                          placeOfBirth:
                                              _tempatLahirController.text,
                                        );
                                        context.read<ProfileCubit>().updateUser(
                                            GetStorage().read("token"),
                                            userRequest);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 42,
                                        child: Center(
                                          child: Text(
                                            'Simpan',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 3),
                              state is AuthLoading
                                  ? LoadingButton()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        primary: Colors.red,
                                      ),
                                      onPressed: () {
                                        LogoutRequest logoutRequest =
                                            LogoutRequest(
                                                token:
                                                    GetStorage().read('token'),
                                                accept: 'application/json');
                                        context
                                            .read<AuthCubit>()
                                            .logout(logoutRequest);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 42,
                                        child: Center(
                                          child: Text(
                                            'Logout',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}
