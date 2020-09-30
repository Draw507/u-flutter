import 'dart:io';

import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProductosBloc {
  final _productosController = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _productsProvider = ProductosProvider();

  Stream<List<ProductoModel>> get productosStream =>
      _productosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarProductos() async {
    final productos = await _productsProvider.cargarProductos();
    _productosController.sink.add(productos);
  }

  void agregarProducto(ProductoModel producto) async {
    _cargandoController.sink.add(true);
    final productos = await _productsProvider.crearProducto(producto);
    _cargandoController.sink.add(false);
    //cargarProductos(); SOLUCION NO OPTIMA
  }

  Future<String> subirFoto(File foto) async {
    _cargandoController.sink.add(true);
    final fotoUrl = await _productsProvider.subirImagen(foto);
    _cargandoController.sink.add(false);

    return fotoUrl;
  }

  void editarProducto(ProductoModel producto) async {
    _cargandoController.sink.add(true);
    await _productsProvider.editarProductos(producto);
    _cargandoController.sink.add(false);
    //cargarProductos(); SOLUCION NO OPTIMA
  }

  void borrarProducto(String id) async {
    //_cargandoController.sink.add(true);
    await _productsProvider.borrarProducto(id);
    //_cargandoController.sink.add(false);
    //cargarProductos(); SOLUCION NO OPTIMA
  }

  dispose() {
    _productosController?.close();
    _cargandoController?.close();
  }
}
