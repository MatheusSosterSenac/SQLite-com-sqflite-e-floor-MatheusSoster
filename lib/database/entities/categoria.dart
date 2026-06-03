import 'package:floor/floor.dart';

@Entity(tableName: 'categorias')
class Categoria {

  @primaryKey
  final int? id;

  final String nome;
  final String cor;

  Categoria({
    this.id,
    required this.nome,
    required this.cor,
  });
}