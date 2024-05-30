import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_event.dart';
import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/models/Users.dart';
import 'package:soxciala/screens/dashboard/ProfileScreen.dart';
import 'package:soxciala/utlis/helper.dart';
import 'package:soxciala/widgets/searchbox.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/followButton.dart';


class FindPeopleScreen extends StatelessWidget {
  const FindPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(GetAllUsers());
    return BlocConsumer<AuthBloc,AuthStates>(
      listener:(context, state) {

      } ,
      builder: (context, state) {

          return Scaffold(
              appBar: AppBar(
                title: const Text('Feeds'),
              ),
              body:
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: state is UsersFetched ? SearchBox(states: state,) : const SizedBox.shrink(),
                  ),
                  ValueListenableBuilder<List<Users>>(
                      valueListenable: Helper.searchList,
                      builder: (v, b, c) {
                        return  Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount:  b.length,
                              itemBuilder: (context,index) {
                                return InkWell(
                                  onTap:  state is AuthLoading ? null : () {
                                   navigateToScreen(context, ProfileScreen(uid: b[index].userUid,));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(radius: 22, backgroundImage:b[index].userImage == null ? null : NetworkImage(b[index].userImage ?? ""),),
                                    title: Text(b[index].userName,),

                                  ),
                                );
                              }),
                        );
                      })
                ],
              )
          );
      }
    );
  }



  }

