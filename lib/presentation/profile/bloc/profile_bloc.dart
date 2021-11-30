import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/user.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
 final AbstarctAuthRepository authRepository;

  ProfileBloc({required this.authRepository})
      : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileEvent) {
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
