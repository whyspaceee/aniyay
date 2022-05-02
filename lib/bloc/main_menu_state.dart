part of 'main_menu_bloc.dart';

abstract class MainMenuState extends Equatable {
  const MainMenuState();

  @override
  List<Object> get props => [];
}

class MainMenuLoading extends MainMenuState {}

class MainMenuLoaded extends MainMenuState {
  final MainMenuModelComplete model;

  const MainMenuLoaded(this.model);
}
