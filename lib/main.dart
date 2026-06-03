import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'database/app_database.dart';
import 'database/entities/categoria.dart';

import 'screens/home_screen.dart';

late AppDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  }

  database = await $FloorAppDatabase
      .databaseBuilder('app.db')
      .build();

  // Cria uma categoria padrão caso ainda não exista
  try {
    await database.categoriaDao.inserirCategoria(
      Categoria(
        id: 1,
        nome: 'Alimentação',
        cor: 'Verde',
      ),
    );
  } catch (_) {
    // Ignora erro caso a categoria já exista
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle Financeiro',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}