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
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(1, \"Quais as principais tarefas da logística?\", 2);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(2, \"O que um bom profissional de logística precisa ter?\", 5);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(3, \"Qual o princípio da logística?\", 11);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(4, \"Quantas etapas a logística possui?\", 14);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(5, \"Qual é a sequência correta das etapas logísticas?\", 17);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(6, \"Qual das tecnologias abaixo é utilizada na logística?\", 24);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(7, \"Como surgiu a logística?\", 27);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(8, \"Quais são os tipos de código que aprendemos?\", 30);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(9, \"Qual é a definição de cross-docking na logística?\", 33);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(10, \"Como a tecnologia está ajudando a melhorar a eficiência da logística?\", 38);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(11, \"Como a logística pode ser utilizada para reduzir os impactos ambientais das operações de uma empresa?\", 44);',
    );
    await database.rawInsert(
      'INSERT INTO perguntas(id, pergunta_texto, resposta_correta) VALUES(12, \"Na logística, o que mais impacta positivamente na satisfação do cliente?\", 46);',
    );

    // Insere as 4 Respostas para as 12 Perguntas

    /* (1° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(1, 1, "Ajudar as empresas");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(2, 1, "O transporte, gestão do estoque e o processamento de pedidos");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(3, 1, "Criar robôs e evoluir, assim contrbuindo com a tecnologia");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(4, 1, "Ajudar os trabalhadores a se manterem organizados");',
    );

    /* (2° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(5, 2, "Avaliar os pontos positivos e negativos do negócio e conhecer bem a concorrência");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(6, 2, "Ser um líder nato e colocar ordem nos projetos da empresa");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(7, 2, "Ser sociável e amigável com os projetos");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(8, 2, "Saber ler e escrever o alfabeto em grego romano");',
    );

    /* (3° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(9, 3, "Separação");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(10, 3, "Transporte");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(11, 3, "Organização");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(12, 3, "Armazenamento");',
    );

    /* (4° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(13, 4, "2");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(14, 4, "4");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(15, 4, "3");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(16, 4, "5");',
    );

    /* (5° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(17, 5, "Recebimento, Armazenamento, Seperação e Transporte");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(18, 5, "Recebimento, Transporte, Seperação e Armazenamento");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(19, 5, "Armazenamento, Transporte, Seperação e Recebimento");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(20, 5, "Transporte, Armazenamento, Seperação e Recebimento");',
    );

    /* (6° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(21, 6, "Sistemas de Trem-Bala para entrega");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(22, 6, "Aviões Cargueiros de alto porte");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(23, 6, "Robôs que trabalham na área automobilística");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(24, 6, "Sistemas de rastreamento e monitoramento de veículos e cargas");', //
    );

    /* (7° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(25, 7, "A logística a surgiu após a 2ª Guerra Mundial para a controlar as empresas e organizações tendo assim, um auto controle sobre todo o transporte e entregas para vários lugares do mundo");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(26, 7, "A logística surgiu após Mark Zuckerberg não aguentar mais problemas no transporte de seus produtos exportados");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(27, 7, "Inicialmente como parte da área militar, que cuidava do planejamento de vários itens, distribuição e manutenção de diversos tipos de materiais e suprimentos");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(28, 7, "A logística surgiu nos tempos antigos na Grécia, na época de Platão");',
    );

    /* (8° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(29, 8, "Código PIN e Database");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(30, 8, "QR Code e Código de Barras");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(31, 8, "Infra-Vermelho e Código Álgebra");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(32, 8, "Codigo Time SK e Time SD");',
    );

    /* (9° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(33, 9, "Operação de deslocamento de carga entre caminhões para entrega imediata");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(34, 9, "Armazenamento temporário de mercadorias");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(35, 9, "Separação de produtos por pedidos");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(36, 9, "Processo de controle de qualidade em armazéns");',
    );

    /* (10° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(37, 10, "No Desenvolvimento de Jogos");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(38, 10, "No Rastreamento e Automação");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(39, 10, "Na criação de novas redes sociais");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(40, 10, "Na ajuda de escolhas políticas");',
    );

    /* (11° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(41, 11, "Descartando a possibilidade de automação de processos");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(42, 11, "Não reciclando os materiais não utilizados");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(43, 11, "Utilizando Transportes mais poluentes");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(44, 11, "Reduzindo a utilização de recursos e evitando desperdícios");', //
    );

    /* (12° Pergunta) */
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(45, 12, "Demora e má gestão na entrega");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(46, 12, "Rapidez e Eficiência na entrega");', //
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(47, 12, "Péssimos preços");',
    );
    await database.rawInsert(
      'INSERT INTO respostas(id, pergunta_id, resposta_texto) VALUES(48, 12, "Tecnologias antigas");',
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
