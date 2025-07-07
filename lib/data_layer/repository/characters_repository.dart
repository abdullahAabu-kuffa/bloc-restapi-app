import 'package:bloc_app/data_layer/api/character_api.dart';
import 'package:bloc_app/data_layer/models/characters.dart';

class CharactersRepository {
  final CharactersAPI charactersAPI;

  CharactersRepository(this.charactersAPI);

  Future<List<Results>> getAllCharacters() async {
    final resultsList = await charactersAPI.getAllCharacters();
    return resultsList.map((json) => Results.fromJson(json)).toList();
  }
}
