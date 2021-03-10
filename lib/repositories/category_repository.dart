import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_clone/models/category.dart';
import 'package:xlo_clone/repositories/parse_errors.dart';
import 'package:xlo_clone/repositories/tables_keys.dart';

class CategoryRepository {

  // Retorna a lista de categorias do ParseServer
  Future<List<Category>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))
        ..orderByAscending(keyCategoryDescription);

    final response = await queryBuilder.query();

    if(response.success) {
      return response.results.map((e) => Category.fromParse(e)).toList();
    } else {
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}