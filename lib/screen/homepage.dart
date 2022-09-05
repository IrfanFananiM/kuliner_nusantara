import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kuliner_nusantara/model/list_recipe.dart';
import 'package:http/http.dart' as http;
import 'package:kuliner_nusantara/screen/card_list.dart';
import 'package:kuliner_nusantara/screen/detail_recipe_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  List<ListRecipe> listRecipe = [];
  bool isLoading = true;

  getData() async {
    Uri url =
        Uri.parse('https://masak-apa-tomorisakura.vercel.app/api/recipes');
    http.Response response = await http.get(url);
    Map<String, dynamic> result = jsonDecode(response.body);

    result['results'].forEach((menu) {
      setState(() {
        listRecipe.add(ListRecipe.fromJson(menu));
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Kuliner Nusantara'),
      ),
      body: isLoading
      ? const Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listRecipe.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => 
                          DetailRecipeScreen(listRecipe: listRecipe[index],)
                        )
                      );
                    },
                    child: CardList(recipeList: listRecipe[index]),
                  );
                }
              )
            ],
          ),
        ),
      )
    );
  }
}