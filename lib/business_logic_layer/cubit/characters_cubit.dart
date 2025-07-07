import 'package:bloc/bloc.dart';
import 'package:bloc_app/data_layer/models/characters.dart';
import 'package:flutter/material.dart';

import 'package:bloc_app/data_layer/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersRepository charactersRepository;
  List<Results> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Results>? getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
