import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_veterinaria/src/util/productos_detalles.dart';

class ProductosPages extends StatefulWidget {
  const ProductosPages({super.key});

  @override
  State<ProductosPages> createState() => ProductosPagesState();
}

class ProductosPagesState extends State<ProductosPages> {
  List<Map<String, dynamic>> products = [];

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://proyectowebuni.com/api/productos-all'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          products = data.cast<Map<String, dynamic>>();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Manejo de la excepción cuando no hay conexión a Internet.
      print('Error de conexión: $e');
      // Puedes mostrar un mensaje de error al usuario o tomar otras medidas apropiadas.
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _builListItem(context, index);
        },
      ),
    );
  }

  Widget _builListItem(BuildContext context, int index) {
    final product = products[index];

    return GestureDetector(
      onTap: () {
        _showProductDetail(context, product);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: 150,
          height: 300,
          child: Card(
            elevation: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Image.network(
                    product['imagen'],
                    fit: BoxFit.cover,
                    width: 150,
                    height: 180,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product['nombre'],
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    '\$${product['precio']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showProductDetail(BuildContext context, Map<String, dynamic> product) {
    // Aquí puedes mostrar los detalles del producto. Puedes navegar a una nueva pantalla
    // o mostrar un diálogo, dependiendo de tus preferencias de diseño.
    // Por ejemplo, puedes usar Navigator para navegar a una nueva pantalla de detalle.
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductosDetalles(product: product),
      ),
    );
  }
}
