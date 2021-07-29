import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:startup/model/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
      "yummly2.p.rapidapi.com",
      "/feeds/list",
      {
        "start": "0",
        "limit": "18",
        "tag": "list.recipe.popular",
      },
    );
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "03582eaf0fmsh1fe58369549286dp149f24jsn5b07b5c4ad46",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
