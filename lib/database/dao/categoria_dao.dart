import 'package:floor/floor.dart';

import '../entities/categoria.dart';

@dao
abstract class CategoriaDao {

  @Query('SELECT * FROM categorias')
  Stream<List<Categoria>> listarCategorias();

  @insert
  Future<void> inserirCategoria(Categoria categoria);
}