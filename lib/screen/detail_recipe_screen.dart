import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kuliner_nusantara/model/list_recipe.dart';
import 'package:http/http.dart' as http;

class DetailRecipeScreen extends StatefulWidget {
  final ListRecipe listRecipe;
  const DetailRecipeScreen({Key? key, required this.listRecipe}) : super(key: key);

  @override
  State<DetailRecipeScreen> createState() => _DetailRecipeScreenState();
}

class _DetailRecipeScreenState extends State<DetailRecipeScreen> {
  Future<Map<String, dynamic>> getDetailRecipe() async {
    Uri uri = Uri.parse("https://masak-apa-tomorisakura.vercel.app/api/recipe/${widget.listRecipe.key!}");
    http.Response response = await http.get(uri);
    Map<String, dynamic> result = jsonDecode(response.body);
    return result['results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: FutureBuilder<Map<String, dynamic>> (
        future: getDetailRecipe(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        widget.listRecipe.title ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), 
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.listRecipe.thumb ?? ''
                          ),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    const Divider(height: 30),
                    Text(
                      snapshot.data?['desc'] ?? '',
                      style: const TextStyle(
                        fontSize: 16
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Resep yang digunakan adalah : ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ), 
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?['ingredient'].length,
                      itemBuilder:  (context, index) {
                        return Text(
                          snapshot.data?['ingredient'][index] ?? '',
                          style: const TextStyle(
                            fontSize: 16
                          ),
                        );
                      }
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Resep yang digunakan adalah : ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?['step'].length,
                      itemBuilder: (contex, index){
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            snapshot.data?['step'][index],
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}