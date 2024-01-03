import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_event.dart';
import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/models/Users.dart';
import 'package:soxciala/screens/login_screen.dart';
import 'package:soxciala/utlis/helper.dart';

import '../../models/Posts.dart';
import '../../utlis/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/followButton.dart';
import '../../widgets/profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key, this.uid}) : super(key: key);
  final String? uid;

  String? username;
  int? followersCount;
  int? followingsCount;
  Stream<List<Posts>>? postsList;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {

    context.read<AuthBloc>().add(AuthUserDataRequested(uid: uid ?? ""));


    return  BlocConsumer<AuthBloc, AuthStates>(
      builder: (context, state) {
        if(state is UsersFetchedFailure) {
          return Center(child: Text(state.failed),);
        }




        if(state is UsersPostsLoading){
          isLoading = true;
        }

         return Scaffold(
           appBar: AppBar(
             automaticallyImplyLeading: false,
             title: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const CustomText(text: 'Profile',),
                 IconButton(
                     onPressed: (){
                       context.read<AuthBloc>().add(AuthLogout());
                     },
                     icon:const Icon(CupertinoIcons.power)
                 )
               ],
             ),
           ),
           body: Column(
             children: [
               const Center(
                 child: CircleAvatar(
                   radius: 50,
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(child: Text(username ?? ""),
                 ),),

               Container(
                 child:  Center(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: ValueListenableBuilder(
                               valueListenable: Helper.followers,
                               builder: (c,p,e) {
                                 return  ProfileEnagementCounts(count: '$p', engageTypeText: 'Followers', );
                               })

                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ValueListenableBuilder(
                           valueListenable: Helper.following,
                           builder: (c,f,e) {
                             print("the followers cou8nt is $f, $e");
                             return ProfileEnagementCounts(count: '$f', engageTypeText: 'Following',);
                           },
                         ),
                       ),
                     ],),
                 ),
               ),
               Visibility(
                 visible: Helper.auth.currentUser?.uid == uid ? false : true,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: FollowButton(text: "Follow", width: MediaQuery.of(context).size.width*0.35,
                     height: MediaQuery.of(context).size.height*0.05,  onPressed: () {
                       context.read<AuthBloc>().add(FollowUserRequested(uid: uid ?? ""));
                     },),
                 ),
               ),
               Expanded(
                   child: isLoading ? const CircularProgressIndicator.adaptive():
                   StreamBuilder<List<Posts>>(
                     stream: postsList,
                     builder: (context, snapshot) {
                       if(snapshot.connectionState == ConnectionState.waiting){
                         return const Center(child: CircularProgressIndicator.adaptive(),);
                       }
                       return GridView.builder(
                         itemCount: snapshot.data?.length ?? 5,
                         shrinkWrap: true,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                           childAspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height *1.25,
                           crossAxisSpacing: 2,
                           mainAxisSpacing: 2,),
                         itemBuilder: (BuildContext context, int index) {
                           final data = snapshot.data;
                           return Stack(children: [
                             Container(
                               height: MediaQuery.of(context).size.height * 0.75,
                               color: AppColors.appPrimaryColor, child: Image.network(data?[index].postImage ?? "", fit: BoxFit.fill,),),
                             Positioned.directional(
                                 textDirection: TextDirection.ltr,
                                 bottom: -3,
                                 child: Container(
                                   child: Row(children: [Icon(CupertinoIcons.heart_fill), Text("100",)], ),))
                           ],
                           );
                         },
                       );
                     }
                   )
               )


             ],
           ),
         );;

      }, listener: (BuildContext context, Object? state) {
          if(state is AuthInitial) {
            navigateAndRemovePush(context, LoginPage());
          }

          if(state is UsersDataFetched){
            context.read<AuthBloc>().add(RequestCurrentUserPosts(currentUserUid: uid ?? ""));
          }

          if(state is UserPostFetched) {
            postsList = state.userPosts;
          }

          if(state is UsersDataFetched) {
            print("here state data is ${state.users.toJson()}");
            username = state.users.userName;
          }



    },
    );
  }
}
