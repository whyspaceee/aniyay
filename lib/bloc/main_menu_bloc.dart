import 'package:aniyay/data/models/main_menu_model.dart';
import 'package:aniyay/data/repositories/main_menu.repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuRepository repository;
  MainMenuBloc(this.repository) : super(MainMenuLoading()) {
    on<RetrieveMainMenuEvent>((event, emit) async {
      final data = await repository.parseFetchMainMenu(event.type);
      emit(MainMenuLoaded(data));
      // TODO: implement event handler
    });
    add(RetrieveMainMenuEvent("ANIME"));
  }
}
