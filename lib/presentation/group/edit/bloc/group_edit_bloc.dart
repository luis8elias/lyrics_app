import 'package:bloc/bloc.dart';

import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/group.dart';

import 'package:lyrics_app/domain/models/api/simple_list.dart';
import 'package:lyrics_app/domain/repositories/groups_repository.dart';

import 'package:meta/meta.dart';

part 'group_edit_event.dart';
part 'group_edit_state.dart';

class GroupEditBloc extends Bloc<GroupEditEvent, GroupEditState> {
  final AbstarctGroupsRepository groupsRepository;

  GroupEditBloc({required this.groupsRepository}) : super(GroupEditInitial()) {
    on<GroupEditEvent>((event, emit) async {
      if (event is LoadingEditGroup) {
        emit(LoadingData());
        SimpleList groups = await groupsRepository.getAll();
        List<Group> groupsList;
        groupsList = groups.data as List<Group>;
        emit(DataLoaded(groups: groupsList));
      } else if (event is SaveGroup) {
        GenericResponse response = await groupsRepository.update(
          name: event.name,
          groupId: event.groupId,
        );

        if (response.success) {
          emit(GroupEdited(message: response.message));
          SimpleList groups = await groupsRepository.getAll();
          List<Group> groupsList = groups.data as List<Group>;
          emit(DataLoaded(groups: groupsList));
        } else {
          emit(GroupNotEdited(message: response.message));
          SimpleList groups = await groupsRepository.getAll();
          List<Group> groupsList = groups.data as List<Group>;
          emit(DataLoaded(groups: groupsList));
        }
      }
    });
  }
}
