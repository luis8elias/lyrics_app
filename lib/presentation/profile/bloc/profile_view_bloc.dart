import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/user.dart';
import 'package:meta/meta.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';

part 'profile_view_event.dart';
part 'profile_view_state.dart';

class ProfileViewBloc extends Bloc<ProfileViewEvent, ProfileViewState> {
  final AbstarctAuthRepository authRepository;

  ProfileViewBloc({required this.authRepository})
      : super(ProfileViewInitial()) {
    on<ProfileViewEvent>((event, emit) async {
      if (event is ProfileViewEvent) {
        emit(LoadingData());
        GenericResponse response = await authRepository.getAutherticatedUser();

        if (response.success) {
          User user = response.data;
          emit(DataLoaded(user: user));
        }
      }
    });
  }
}
