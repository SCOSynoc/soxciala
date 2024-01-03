


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soxciala/AuthBloc/Login/auth_event.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_events.dart';
import 'package:soxciala/AuthBloc/SignUp/signup_states.dart';
import 'package:soxciala/repository/Firebase/auth_repository.dart';

class SignupBloc extends Bloc<SignupEvents, SignupStates> {

  SignupBloc() : super(SignupInitial()) {
     on<SignupRequested>(_signupRequested);
  }

  AuthService service = AuthService()..initializeInstances();


  void _signupRequested(SignupRequested event, Emitter<SignupStates> emit) async{
    emit(SignupLoading());
    try {
      final email = event.email;
      final password = event.password;
      final name = event.name;
      final mobile = event.mobile;

      if(email.isEmpty){
       return emit(SignupFailure(error: "Email should not be empty")) ;
      }

      if(password.length < 8) {
        emit(SignupFailure(error: "Password is too short"));
      }
        service.signInUserWithEmailAndPassword(email: email, password: password, mobile: mobile, name: name).then((value) {
          service.saveUserToFirestore(email: email, password: password, mobile: mobile, name: name);
        });
        return emit(SignupSuccess());
    } catch (e) {
      return emit(SignupFailure(error:e.toString()));
    }
  }
}