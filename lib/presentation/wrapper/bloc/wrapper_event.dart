part of 'wrapper_bloc.dart';

@immutable
abstract class WrapperEvent {}

class IndexChangedEvent extends WrapperEvent{
  IndexChangedEvent({required this.index});
  final int index;
}

