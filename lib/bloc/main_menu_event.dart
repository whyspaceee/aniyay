part of 'main_menu_bloc.dart';

abstract class MainMenuEvent extends Equatable {
  const MainMenuEvent();

  @override
  List<Object> get props => [];
}

class RetrieveMainMenuEvent extends MainMenuEvent {
  String type;

  RetrieveMainMenuEvent(this.type);
}
