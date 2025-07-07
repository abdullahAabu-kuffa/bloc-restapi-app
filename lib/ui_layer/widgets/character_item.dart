import 'package:bloc_app/constants/my_colors.dart';
import 'package:bloc_app/constants/strings.dart';
import 'package:bloc_app/data_layer/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Results character;
  const CharacterItem({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWaite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap:
            () => Navigator.pushNamed(
              context,
              characterDetailsScreen,
              arguments: character,
            ),
        child: GridTile(
          footer: Hero(
            tag: character.id as int,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.name}',
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWaite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGray,
            child:
                (character.name != null &&
                        character.name!.isNotEmpty &&
                        character.image != null &&
                        character.image!.isNotEmpty)
                    ? FadeInImage.assetNetwork(
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      placeholder: 'assets/images/loading-icon.gif',

                      image: character.image!,
                    )
                    : Image.asset('assets/images/OIP.jfif'),
          ),
        ),
      ),
    );
  }
}
