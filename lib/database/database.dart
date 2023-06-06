import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabasePerguntas {
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'databaseperguntas.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      'CREATE TABLE perguntas(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, pergunta_texto TEXT, resposta_correta INTEGER );',
    );

    await database.execute(
      'CREATE TABLE respostas(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, pergunta_id INTEGER, resposta_texto TEXT );',
    );

    // Insere as 12 Perguntas
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(1, \"Qual a capital do Brasil?\", 2);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(2, \"Qual a capital da França?\", 5);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(3, \"Qual a capital da Alemanha?\", 11);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(4, \"Qual a capital da Romênia?\", 14);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(5, \"Qual a capital da Grécia?\", 17);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(6, \"Qual a capital da Bélgica?\", 24);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(7, \"Qual a capital da Espanha?\", 27);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(8, \"Qual a capital de Portugal?\", 30);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(9, \"Qual a capital da Itália?\", 33);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(10, \"Qual a capital de Estados Unidos?\", 38);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(11, \"Qual a capital da Rússia?\", 44);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(12, \"Qual a capital da Noruega?\", 46);',
    );

    // Insere as 4 Respostas para as 12 Perguntas

    /* (1° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(1, 1, "Rio de Janeiro");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(2, 1, "Distrito Federal");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(3, 1, "São Paulo");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(4, 1, "Jundiaí");',
    );

    /* (2° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(5, 2, "Paris");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(6, 2, "Marselha");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(7, 2, "Lyon");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(8, 2, "Nice");',
    );

    /* (3° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(9, 3, "Munique");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(10, 3, "Frankfurt");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(11, 3, "Berlim");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(12, 3, "Dortmund");',
    );

    /* (4° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(13, 4, "Iasi");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(14, 4, "Bucareste");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(15, 4, "Timisoara");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(16, 4, "Galati");',
    );

    /* (5° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(17, 5, "Atenas");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(18, 5, "Piraeus");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(19, 5, "Meteora");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(20, 5, "Santorini");',
    );

    /* (6° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(21, 6, "Dinant");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(22, 6, "Bruges");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(23, 6, "Antuérpia");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(24, 6, "Bruxelas");', //
    );

    /* (7° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(25, 7, "Segóvia");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(26, 7, "Sevilha");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(27, 7, "Barcelona");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(28, 7, "Granada");',
    );

    /* (8° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(29, 8, "Porto");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(30, 8, "Lisboa");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(31, 8, "Sintra");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(32, 8, "Cascais");',
    );

    /* (9° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(33, 9, "Roma");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(34, 9, "Milão");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(35, 9, "Veneza");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(36, 9, "Bolonha");',
    );

    /* (10° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(37, 10, "Boston");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(38, 10, "Washington");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(39, 10, "Miami");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(40, 10, "Nova Iorque");',
    );

    /* (11° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(41, 11, "Ecaterimburgo");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(42, 11, "Novosibirsk");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(43, 11, "São Petersburgo");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(44, 11, "Moscou");', //
    );

    /* (12° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(45, 12, "Tromso");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(46, 12, "Oslo");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(47, 12, "Voss");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(48, 12, "Flam");',
    );
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getTodasPerguntas() async {
    final db = await DatabasePerguntas.db();
    return db.query('perguntas', orderBy: "id");
  }

  // Get pergunta com base no id
  static Future<List<Map<String, dynamic>>> getPergunta(int id) async {
    final db = await DatabasePerguntas.db();
    final result =
        db.query('perguntas', where: "id = ?", whereArgs: [id], limit: 1);
    return result;
  }

  // Get respostas com base no id
  static Future<List<Map<String, dynamic>>> getRespostas(int id) async {
    final db = await DatabasePerguntas.db();
    final result =
        db.query('respostas', where: "pergunta_id = ?", whereArgs: [id]);
    return result;
  }
}
