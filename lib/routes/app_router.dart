import 'package:bloc_app/business_logic_layer/cubit/characters_cubit.dart';
import 'package:bloc_app/constants/strings.dart';
import 'package:bloc_app/data_layer/api/character_api.dart';
import 'package:bloc_app/data_layer/models/characters.dart';
import 'package:bloc_app/data_layer/repository/characters_repository.dart';
import 'package:bloc_app/ui_layer/screens/character_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_app/ui_layer/screens/characters_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersAPI());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings sittings) {
    switch (sittings.name) {
      case allCharactersRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (BuildContext context) => charactersCubit,
                child: CharactersScreen(),
              ),
        );
      case characterDetailsScreen:
        final character = sittings.arguments as Results;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(character: character),
        );
    }
    return null;
  }
}
