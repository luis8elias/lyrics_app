import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/config_repository.dart';
import 'package:lyrics_app/domain/repositories/groups_repository.dart';
import 'package:meta/meta.dart';

part 'create_group_event.dart';
part 'create_group_state.dart';

class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {

  final AbstarctGroupsRepository groupsRepository;
  final AbstarctConfigRepository configRepository;



  CreateGroupBloc({ required this.configRepository, required this.groupsRepository}) : super(CreateGroupInitial()) {
    on<CreateGroupEvent>((event, emit) async{


      if(event is CreateGroup){
        GenericResponse response = await groupsRepository.save(
          name: event.name,
        );

        if(response.success){
          configRepository.setSelctedGroup(
            groupId: response.data
          );
          emit(GroupCreated(message: response.message));
        }else{
          emit(GroupNotCreated(message: response.message));
        }

      }
      
    });
  }
}
