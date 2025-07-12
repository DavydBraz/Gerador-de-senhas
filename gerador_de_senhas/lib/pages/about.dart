import 'package:flutter/material.dart';
import 'package:gerador_de_senhas/utils/textUtils.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o App'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(31, 2, 2, 2),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              textTitle('Gerador de Senhas – Simples, Rápido e Seguro.'),
              Divider(color: Colors.white,),
              SizedBox(height: 20),
              textCheckBox("Este aplicativo foi criado para ajudar você a gerar senhas fortes com base nas suas preferências. Personalize como quiser:"),
              SizedBox(height: 20),
              textCheckBox('•''Letras minúsculas'),
              textCheckBox('•''Letras maiúsculas'),
              textCheckBox('•''Números'),
              textCheckBox('•''Caracteres especiais'),
              textCheckBox('•''Tamanho da senha'),
              SizedBox(height: 20),

              Divider(color: Colors.white,),
              SizedBox(height: 20),
              textCheckBox('💡 Dica de uso:\nUse senhas diferentes para cada serviço e evite reutilizar as mesmas combinações. Segurança começa com bons hábitos.'),
              SizedBox(height: 20),
              Divider(color: Colors.white,),
              SizedBox(height: 20),

              textCheckBox('Versão: 1.0.0'),

            ],
          ),
        ),
      ),
    );
  }
}