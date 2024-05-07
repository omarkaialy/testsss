import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:login_form/auth/data/models/auth_model.dart';
import 'package:login_form/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await AuthRepo().login(event.email, event.password);
      result.fold((left) {
        BotToast.showText(text: left.message);
        emit(AuthFailure());
      }, (right) => emit(AuthSuccess(auth: right)));
    });
  }
}
