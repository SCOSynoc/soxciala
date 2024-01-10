import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_event.dart';
import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/models/Users.dart';
import 'package:soxciala/screens/login_screen.dart';
import 'package:soxciala/screens/signup_screen.dart';
import 'package:soxciala/utlis/helper.dart';
import 'package:soxciala/widgets/ImageUpdatePage.dart';
import 'package:soxciala/widgets/side_drawer_profile.dart';

import '../../models/Posts.dart';
import '../../utlis/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/followButton.dart';
import '../../widgets/profile_widgets.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, this.uid}) : super(key: key);
  final String? uid;



  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? username;
  int? followersCount;
  int? followingsCount;
  Stream<List<Posts>>? postsList;
  bool isLoading = false;
  String? userImage;
  bool alreadyFollowed = false;
  Users? currentUser;


  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthUserDataRequested(uid: widget.uid ?? ""));
    context.read<AuthBloc>().add(CheckAlreadyFollowedEvent(currentUserUid: "", followedUserId: widget.uid ?? ""));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    context.read<AuthBloc>().add(AuthUserDataRequested(uid: widget.uid ?? ""));
    context.read<AuthBloc>().add(CheckAlreadyFollowedEvent(currentUserUid: "", followedUserId: widget.uid ?? ""));
  }


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AuthBloc, AuthStates>(
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
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Profile',),
              ],
            ),
          ),
          endDrawer:Helper.auth.currentUser?.uid == widget.uid ?
          SideProfileDrawer(
            updateProfile: () {
                  navigateToScreen(context, SignUpPage(users: currentUser,));
          },
            logout: () { context.read<AuthBloc>().add(AuthLogout()); },
            updateProfileImage: () {
                navigateToScreen(context, ImageUpdatePage(user: currentUser!));
            },)
              : null,
          body: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:userImage == null ? null : NetworkImage(userImage!) ,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(username ?? ""),
                ),),

              StreamBuilder<Users>(
                  stream: currentUser == null ? null : Stream.value(currentUser!),
                  builder: (context, snapshot) {
                    return Container(
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
                    );
                  }
              ),
              Visibility(
                visible: Helper.auth.currentUser?.uid == widget.uid ? false : true,
                child: StreamBuilder<Users>(
                    stream: currentUser == null ? null: Stream.value(currentUser!),
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FollowButton(text: alreadyFollowed? "Unfollow": "Follow", width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.height*0.05,  onPressed: () {
                            if(alreadyFollowed){
                              context.read<AuthBloc>().add(UnFollowUserRequested(uid: widget.uid ?? ""));
                            }else{
                              context.read<AuthBloc>().add(FollowUserRequested(uid: widget.uid ?? ""));
                            }

                          },),
                      );
                    }
                ),
              ),
              Expanded(
                  child: isLoading ?
                  const CircularProgressIndicator.adaptive():
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
                                color: AppColors.appPrimaryColor, child: Image.network(
                                data?[index].postImage ?? "",
                                fit: BoxFit.fill,
                                color: Colors.black54,
                                colorBlendMode: BlendMode.darken,
                              ),),
                              Positioned.directional(
                                textDirection: TextDirection.ltr,
                                bottom: -3,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(CupertinoIcons.heart, color: Colors.white, size: 18,),
                                      const SizedBox(width: 5,),
                                      Text(data?[index].likes.length.toString() ?? "",
                                        style: const TextStyle( color: Colors.white),)],
                                  ),
                                ),

                              )
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
        context.read<AuthBloc>().add(RequestCurrentUserPosts(currentUserUid: widget.uid ?? ""));
      }

      if(state is UserPostFetched) {
        postsList = state.userPosts;
      }

      if(state is UsersDataFetched) {
        print("here state data is ${state.users.toJson()}");
        currentUser = state.users;
        username = state.users.userName;
        userImage = state.users.userImage;
      }

      if(state is UserFollowedCheckSuccess){
          alreadyFollowed = state.isFollowing;
          print("already followed value $alreadyFollowed");
      }

      if(state is UserFollowedSuccess){
        alreadyFollowed = true;
      }

      if(state is UserUnFollowedSuccess) {
        alreadyFollowed = false;
      }
    },
    );
  }
}


