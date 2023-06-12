import 'package:flutter/material.dart';

import '../database/database.dart';

class Perguntas extends StatefulWidget {
  final int num_pergunta;
  const Perguntas({
    super.key,
    required this.num_pergunta,
  });

  @override
  State<Perguntas> createState() => _PerguntasState();
}

class _PerguntasState extends State<Perguntas> {
  List<Map<String, dynamic>> myPerguntas = [];
  List<Map<String, dynamic>> myRespostas = [];
  int? _character;
  final formKey = GlobalKey<FormState>();

  final snackBarCorreta = SnackBar(
    content: const Text(
      'Resposta Correta!',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.green,
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  // This function is used to fetch all data from the database
  void _refreshData() async {
    final dataPerg = await DatabasePerguntas.getPergunta(widget.num_pergunta);
    final dataResp = await DatabasePerguntas.getRespostas(widget.num_pergunta);
    setState(() {
      myPerguntas = dataPerg;
      myRespostas = dataResp;
    });
  }

  final snackBarIncorreta = SnackBar(
    content: const Text(
      'Resposta Incorreta! Tente Novamente!',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.red,
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  validaResposta() {
    print(_character);

    if (myPerguntas.length > 0) {
      if (_character == myPerguntas[0]['resposta_correta']) {
        ScaffoldMessenger.of(context).showSnackBar(snackBarCorreta);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBarIncorreta);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    final pergunta =
        (myPerguntas.length > 0 ? myPerguntas[0]['pergunta_texto'] : '');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pergunta'),
        backgroundColor: const Color(0xFF001D3D),
      ),
      body: Form(
        key: formKey,
        child: Container(
          height: 550,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 25),
                child: Text('$pergunta'),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: myRespostas.length,
                    itemBuilder: (context, index) {
                      return RadioListTile<int>(
                        title: Text(myRespostas[index]['resposta_texto']),
                        value: myRespostas[index]['id'],
                        groupValue: _character,
                        onChanged: (int? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      );
                    }),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Validar Resposta'),
                onPressed: validaResposta,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
