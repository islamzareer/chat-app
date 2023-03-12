import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'User not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: "Wrong password"));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: "Weak password"));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: "Email already exist"));
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }
}
