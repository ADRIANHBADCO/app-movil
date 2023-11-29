import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_veterinaria/src/util/carrusel_vt.dart';
import 'package:app_veterinaria/src/util/search_services.dart';
import 'package:app_veterinaria/src/util/productos_pages.dart';
import 'package:app_veterinaria/src/widgets/subtitulo_text.dart';
import 'package:app_veterinaria/src/util/horizontal_servicios.dart';
import 'package:app_veterinaria/src/util/horizontal_categorias.dart';
import 'package:app_veterinaria/src/authenticated/carrito_compras.dart';
import 'package:app_veterinaria/src/authenticated/home/home_controller.dart';
import 'package:app_veterinaria/src/authenticated/profile/info/sidebar_menu.dart';

class HomeSignin extends StatefulWidget {
  HomeController con = Get.put(HomeController());

  @override
  State<HomeSignin> createState() => _HomeSigninState();
}

class _HomeSigninState extends State<HomeSignin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFFFB0404),
        elevation: 0,
        title: InkWell(
          onTap: () {
            showSearch(context: context, delegate: SearchServices());
          },
          child: Center(
            child: Container(
              height: 35,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Text('Buscar en cachorro PET',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Roboto',
                            fontSize: 15.0,
                          )),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_shopping_cart_outlined,
                    color: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CarritoCompras(),
                  ));
                },
              ),
              Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    constraints:
                        const BoxConstraints(minWidth: 14, maxHeight: 18),
                    child: const Text(
                      "0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          )
        ],
      ),
      body: ListView(
        children: const [
          Column(
            children: [
              CarruselVt(),
              Padding(
                  padding: EdgeInsets.only(right: 300.0),
                  child: SubtituloText(text: 'Categorias')),
              HorizontalCategorias(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 300.0),
                child: SubtituloText(text: 'Servicios'),
              ),
              HorizontalServicios(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 300.0),
                  child: SubtituloText(text: 'Productos')),
              ProductosPages(),
              SizedBox(height: 20.0)
            ],
          ),
        ],
      ),
    );
  }
}