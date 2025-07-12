import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gerador_de_senhas/pages/about.dart';
import 'package:gerador_de_senhas/pages/optionsGeneratepage.dart';
import 'package:gerador_de_senhas/utils/textUtils.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            Icon(Icons.lock, color: const Color.fromARGB(179, 240, 237, 237), size: 240,),
            InkWell(//Abrir tela de gerar senhas
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Optionsgeneratepage())
              );
            },child: Padding(
              padding: const EdgeInsets.fromLTRB(24,10,0,10),
              child: Row(
                children: [
                  Icon(Icons.password, color: Colors.white,),
                  textMenu("  Gerar senhas"),
                ],
              ),
            ),
            ),
            InkWell(//Abrir tela de Sobre
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
              },
              child: Padding(
              padding: const EdgeInsets.fromLTRB(24,10,0,10),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.white,),
                    textMenu("  Sobre"),
                  ],
                ),
              ),
            ),
            InkWell(//Fechar o codigo
              onTap: () {
                exit(0);//encerra o codigo imediatamente
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24,10,0,10),
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.white,),
                    textMenu("  Sair"),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}