import 'package:get/get.dart';
import 'package:app_veterinaria/src/models/category.dart';
import 'package:app_veterinaria/src/environment/environment.dart';

class CategoriesProvider extends GetConnect {
  String url = Environment.API_URL + 'api/categoriessn';

  Future<List<Category>> getAll() async {
    try {
      Response response = await get('$url/getAll', headers: {
        'Content-Type': 'application/json',
        //'Authorization': userSession.sessionToken ?? ''
      }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

      if (response.statusCode == 401) {
        Get.snackbar('Peticion denegada',
            'Tu usuario no tiene permitido leer esta informacion');

        return [];
      }

      List<Category> categories = Category.fromJsonList(response.body ?? {});

      return categories;
    } catch (e) {
      // Manejo de la excepción
      print('Error en getAll: $e');
      // Puedes lanzar la excepción nuevamente o devolver un valor predeterminado, según tus necesidades.
      throw e;
      // O devuelve un valor predeterminado, por ejemplo:
      // return [];
    }
  }
}
