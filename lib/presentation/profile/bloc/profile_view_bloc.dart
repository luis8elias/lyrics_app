import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_view_event.dart';
part 'profile_view_state.dart';

class ProfileViewBloc extends Bloc<ProfileViewEvent, ProfileViewState> {
  ProfileViewBloc() : super(ProfileViewInitial()) {
    on<ProfileViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
