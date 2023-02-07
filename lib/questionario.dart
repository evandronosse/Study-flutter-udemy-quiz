import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, dynamic>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas;
    if (temPerguntaSelecionada) {
      respostas = perguntas[perguntaSelecionada]['respostas'];
    } else {
      respostas = [];
    }
    return Column(
      children: [
        Questao(
          perguntas[perguntaSelecionada]['texto'].toString(),
        ),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => responder(resp['pontuacao'] ?? 0),
          );
        }).toList(),
      ],
    );
  }
}
