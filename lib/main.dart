import 'package:airplane/views/pages/bonus_page.dart';
import 'package:airplane/views/pages/get_started_page.dart';
import 'package:airplane/views/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/destination_cubit.dart';
import 'cubit/page_cubit.dart';
import 'cubit/seat_cubit.dart';
import 'cubit/transaction_cubit.dart';
import 'views/pages/main_page.dart';
import 'views/pages/sign_In_page.dart';
import 'views/pages/sign_up_page.dart';
import 'views/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageCubit>(create: (context) => PageCubit()),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<DestinationCubit>(create: (context) => DestinationCubit()),
        BlocProvider<SeatCubit>(create: (context) => SeatCubit()),
        BlocProvider<TransactionCubit>(create: (context) => TransactionCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/success': (context) => const SuccessCheckoutPage(),
        },
      ),
    );
  }
}
