// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kuliner_nusantara/model/list_recipe.dart';


class CardList extends StatelessWidget {
  final ListRecipe? recipeList;
  const CardList({Key? key, @required this.recipeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              recipeList?.title ?? '',
              textAlign: TextAlign.center,
            ),
          ),
          Image.network(recipeList?.thumb ?? '',fit: BoxFit.cover),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton.icon(
                onPressed: () {null;}, 
                icon: const Icon(Icons.food_bank_rounded), 
                label: Text(recipeList?.portion ??'')
              ),
              TextButton.icon(
                onPressed: (){null;},
                icon: const Icon(Icons.timer_outlined),
                label: Text(recipeList?.times ?? '')
              )
            ],
          ),
        ],
      ),
    );
  }
}