import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/utlis/helper.dart';



import '../../AuthBloc/Login/auth_bloc.dart';
import '../../AuthBloc/Login/auth_event.dart';
import '../../AuthBloc/SignUp/signup_bloc.dart';
import '../../FeedsBloc/feed_bloc.dart';
import '../../FeedsBloc/feed_events.dart';
import '../../repository/local_storage.dart';
import '../../utlis/colors.dart';
import 'AddPostsScreen.dart';
import 'FeedsScreen.dart';
import 'FindPeopleScreen.dart';
import 'ProfileScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int currentIndex = 0;

  List pages = [
    const FeedsScreen(),
    const FindPeopleScreen(),
    const AddPostScreen(),
     ProfileScreen(uid: Helper.auth.currentUser?.uid,)
  ];




  // @override
  // void initState() {
  //   super.initState();
  //   LocalDataService loService = HiveService();
  //
  //   print("${loService.getData(key: "userData")}");
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(AlreadyAuthenticatedCheck())),
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => FeedsBloc()..add(FetchFeedsRequested()))
      ],
      child: Scaffold(
        backgroundColor: AppColors.appPrimaryColor,
        bottomNavigationBar:
        BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index){
              setState(() {
                currentIndex = index;
              });
            },
            backgroundColor: AppColors.appSecondaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: AppColors.fillColor,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: AppColors.appSecondaryColor,
                  icon: const Icon(Icons.home, size: 30),
                  label:"Home"
              ),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.appSecondaryColor,
                  icon: const Icon(Icons.search ,size: 30),
                  label:"search"
              ),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.appSecondaryColor,
                  icon: const Icon(Icons.add_box),
                  label:"Add"
              ),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.appSecondaryColor,
                  icon: const Icon(Icons.person, size: 30),
                  label:"profile"
              )
            ]
        ),
        body: pages[currentIndex],
      ),
    );
  }
}