import 'package:bloc_app/constants/my_colors.dart';
import 'package:bloc_app/data_layer/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character;
  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name as String,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        background: Hero(
          tag: character.id as int,
          child: Image.network(character.image as String, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWaite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: MyColors.myWaite, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      endIndent: endIndent,
      height: 30,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  Widget buildSliverDelagate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        characterInfo('status : ', character.status!),
        buildDivider(300),

        characterInfo(
          'episode : ',
          character.episode!
              .map((element) => element.split('/').last)
              .join(','),
        ),
        buildDivider(290),

        characterInfo('species : ', character.species!),
        buildDivider(285),

        characterInfo('gender : ', character.gender!),
        buildDivider(290),

        characterInfo('origin : ', character.origin!.name!),
        buildDivider(290),

        characterInfo('location : ', character.location!.name!),
        buildDivider(280),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: buildSliverDelagate(),
              ),
              SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }
}
