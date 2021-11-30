import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/group.dart';
import 'package:lyrics_app/domain/models/api/simple_list.dart';
import 'package:lyrics_app/domain/models/api/user.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:lyrics_app/domain/repositories/config_repository.dart';
import 'package:lyrics_app/domain/repositories/groups_repository.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AbstarctAuthRepository authRepository;
  final AbstarctGroupsRepository groupsRepository;
  final AbstarctConfigRepository configRepository;

  ProfileBloc({required this.configRepository, required this.authRepository, required this.groupsRepository})
      : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is LoadingProfile) {
        emit(LoadingData());
        GenericResponse response = await authRepository.getAutherticatedUser();
        if (response.success) {
          User user = response.data;
          SimpleList groups = await groupsRepository.getAll();
          List<Group> groupsList = groups.data as List<Group>;
          emit(DataLoaded(user: user, groups: groupsList));
        }
      } else if (event is Logout) {
        GenericResponse response = await authRepository.logout();
        if (response.success) {
          emit(SuccessLogout(message: response.message));
        } else {
          emit(LogoutFailed(message: response.message));
        }
      } else if (event is DeleteGroup) {
        
        GenericResponse response =
            await groupsRepository.delete(groupId: event.groupId);
        if (response.success) {
          emit(GroupDeleted(message: response.message));

          GenericResponse responseUser =
              await authRepository.getAutherticatedUser();
          User user = responseUser.data;

          SimpleList groups = await groupsRepository.getAll();
          List<Group> groupsList = groups.data as List<Group>;

          if(groupsList.length != 0){
            configRepository.setSelctedGroup(groupId: groupsList[0].id);
          }else{
            configRepository.setSelctedGroup(groupId: -1);
          }

          emit(DataLoaded(groups: groupsList, user: user));
        } else {
          emit(GroupNotDeleted(message: response.message));
          GenericResponse responseUser =
              await authRepository.getAutherticatedUser();
          User user = responseUser.data;

          SimpleList groups = await groupsRepository.getAll();
          List<Group> groupsList = groups.data as List<Group>;
          emit(DataLoaded(groups: groupsList, user: user));
        }
      }else if(event is SelectGroup){
        emit(LoadingData());
        configRepository.setSelctedGroup(groupId: event.groupId);
        GenericResponse responseUser =
              await authRepository.getAutherticatedUser();
        User user = responseUser.data;

        SimpleList groups = await groupsRepository.getAll();
        List<Group> groupsList = groups.data as List<Group>;
        emit(DataLoaded(groups: groupsList, user: user));

      }
    });
  }
}
