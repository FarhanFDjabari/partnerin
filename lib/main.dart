import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as GetTransition;
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partnerin/constants.dart';
import 'package:partnerin/ui/auth/login.dart';
import 'package:partnerin/ui/auth/owner_info.dart';
import 'package:partnerin/ui/auth/owner_register.dart';
import 'package:partnerin/ui/auth/register_option.dart';
import 'package:partnerin/ui/auth/reset_password.dart';
import 'package:partnerin/ui/auth/user_register.dart';
import 'package:partnerin/ui/auth/verification_process.dart';
import 'package:partnerin/ui/home_owner/owner_home_page.dart';
import 'package:partnerin/ui/home_user/category_page.dart';
import 'package:partnerin/ui/home_user/home_page.dart';
import 'package:partnerin/ui/pengajuan/detail_pengajuan.dart';
import 'package:partnerin/ui/pengajuan/pengajuan_page.dart';
import 'package:partnerin/ui/profile/profile_page.dart';
import 'package:partnerin/ui/profile/ubah_password.dart';
import 'package:partnerin/ui/splash.dart';
import 'package:partnerin/ui/transaksi/detail_bisnis.dart';
import 'package:partnerin/ui/transaksi/metode_pembayaran.dart';
import 'package:partnerin/ui/transaksi/verifikasi_pengajuan.dart';
import 'package:partnerin/ui/usaha/detail_usaha.dart';
import 'package:partnerin/ui/usaha/usaha_page.dart';
import 'package:partnerin/widgets/article_webview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DotEnv().load(fileName: '.env');
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PartnerIn',
      theme: ThemeData(
        primaryColor: Constants.PARTNERIN_TEAL,
        accentColor: Constants.PARTNERIN_TEAL,
        primaryColorLight: Constants.PARTNERIN_TEAL,
        primaryColorDark: Constants.PARTNERIN_TEAL,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
          subtitle2: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          subtitle1: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          headline1: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          headline2: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          headline3: GoogleFonts.poppins(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 16,
          ),
          headline4: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          headline5: GoogleFonts.poppins(
            color: Constants.PARTNERIN_TEAL,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          headline6: GoogleFonts.poppins(
            color: Constants.PARTNERIN_TEAL,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          bodyText2: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          button: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          caption: GoogleFonts.poppins(
            color: Constants.PARTNERIN_TEAL,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      getPages: [
        GetPage(
          name: '/splash',
          page: () => Splash(),
          transition: GetTransition.Transition.native,
        ),
        GetPage(
          name: '/login',
          page: () => Login(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/register',
          page: () => RegisterOption(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/user-register',
          page: () => UserRegister(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/owner-register',
          page: () => OwnerRegister(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/owner-info',
          page: () => OwnerInfo(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/verification-process',
          page: () => VerificationProcess(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/verifikasi-pengajuan',
          page: () => VerifikasiPengajuan(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/usaha',
          page: () => UsahaPage(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/detail-usaha',
          page: () => DetailUsaha(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/pengajuan',
          page: () => PengajuanPage(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/detail-pengajuan',
          page: () => DetailPengajuan(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/change-password',
          page: () => UbahPassword(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/category',
          page: () => CategoryPage(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/detail-bisnis',
          page: () => DetailBisnis(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/metode-pembayaran',
          page: () => MetodePembayaran(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/article',
          page: () => ArticleWebview(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/reset-password',
          page: () => ResetPassword(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/',
          page: () => HomePage(),
          transition: GetTransition.Transition.cupertino,
        ),
        GetPage(
          name: '/owner-home',
          page: () => OwnerHomePage(),
          transition: GetTransition.Transition.cupertino,
        )
      ],
      initialRoute: '/splash',
    );
  }
}
