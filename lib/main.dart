import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:soxciala/AuthBloc/Login/auth_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_event.dart';
import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_bloc.dart';
import 'package:soxciala/FeedsBloc/feed_events.dart';
import 'package:soxciala/screens/dashboard/DashBoardScreen.dart';
import 'package:soxciala/screens/login_screen.dart';
import 'package:soxciala/screens/splash_screen.dart';
import 'package:soxciala/utlis/helper.dart';

import 'bloc_observer.dart';
import 'firebase_options.dart';


const darkModeBox = 'darkModeTutorial';




void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);

  runApp(const  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(AlreadyAuthenticatedCheck())),
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => FeedsBloc()..add(FetchFeedsRequested()))
      ],
      child: BlocConsumer<AuthBloc, AuthStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SplashScreen(),

          );
        }, listener: (BuildContext context, Object? state) {
          if(state is AlreadyAuthenticated) {

          }
      },
      ),
    );
  }
}

