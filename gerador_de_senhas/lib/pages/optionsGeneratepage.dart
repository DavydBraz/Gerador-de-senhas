import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerador_de_senhas/utils/randomValues.dart' as data;
import 'package:gerador_de_senhas/utils/textUtils.dart';

class Optionsgeneratepage extends StatefulWidget {
  const Optionsgeneratepage({super.key});

  @override
  State<Optionsgeneratepage> createState() => _OptionsgeneratepageState();
}

class _OptionsgeneratepageState extends State<Optionsgeneratepage> {

  Map<String, bool> checkbox={
    "Maiúsculas (ABC)":false,
    "Minúsculas (abc)":true,
    "Números (123)":false,
    "Caracteres especiais (.!%)":false,
  };

  List passRandom = ["Valor aleatorio"];
  int trueOptions=0;
  double sizePass=12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerar senhas"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(31, 2, 2, 2),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: checkbox.length, 
                itemBuilder: (context, index){
                  return CheckboxListTile(
                    title: textCheckBox(checkbox.keys.toList()[index]),
                    value: checkbox.values.toList()[index], 
                    onChanged: (bool? value){//Caso o valor va mudar
                      if(value==false && _oneTrueValues()){//Se quiser mudar o valor para falso e so tem um unico valor true, entao nao faz
                        ScaffoldMessenger.of(context).showSnackBar(//Ao clicar tentando tirar a unica opção que tem aparece mensagem de aviso sobre
                          SnackBar(
                            content: Text("Você tem que ter pelo menos um campo selecionado!"),
                            backgroundColor: Colors.white10,
                            duration: Durations.long4,
                          )
                        );
                        return;
                      }
                      setState(() {
                        checkbox[checkbox.keys.toList()[index]]=value!;//estou passando a referencia da memoria para ser atualizada
                      });
                    }
                  );
                }
              ),
            ),
            textCheckBox("Tamanho da senha:"),
            Slider(
              value: sizePass,
              min: 12, 
              max: 24, 
              divisions: 12,
              label: sizePass.round().toString(),//o valor exibido trata do numero selecionado e arredondado convertio para um string. 
              onChanged: (double value){//quando mudar o valor
              setState(() {
                sizePass=value;//atualiza o valor do tamanho da senha
                });
              }, 
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textPass(passRandom.join().toString()),
                IconButton(onPressed: (){
                  Clipboard.setData(ClipboardData(text: passRandom.join().toString()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: Colors.white10, content: Text("Texto Copiado!"), duration: Durations.long4,)
                  );
                }, icon: Icon(Icons.copy))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 160),
              child: FloatingActionButton(child: Icon(Icons.refresh),onPressed: (){
                //aqui que rola a magica de aleatoriedade
                //Atualizo o estado atualizando o valor da senha gerada com base na logica la em baixo
                setState(() {                
                  passRandom=data.randomValue(_listResults(), sizePass: sizePass);
                });

              }),
            )
          ],
        ),
      ),
    );
  }

  //Logica para pegar as listas aleatorias e delas só passar para o randomValue que gera a senha aleatoria com base na lista recebida e no tamanho escolhido
  bool _oneTrueValues() {//Porque se so tiver um valor true ai não posso negar-lo, tem que ter no minimo 1
    int trueOptions=0;

    checkbox.forEach((key,value){
      if (value==true) {
        trueOptions++;
      }
    });
    return trueOptions==1;
  }

  List _trueOptions() {//porque daqui pego somente os que tem true
    List trueValues=[];

    checkbox.forEach((key,value){
      if (value==true) {
        trueValues.add(key);
      }
    });
    return trueValues;
  }

  List _listResults() {//Pega os itens correspondentes que estao dentro das listas como true valores
    List keyOptions = _trueOptions(); // suas opções ativas
    return [
      for (var chave in keyOptions) ...?data.checkbox[chave]//pega todos os valores das chaves ativas e espalha (concatena) na lista final utilizando do
      //Spread (...). sendo data o nome que ei a classe de randomvalue que contem um map com as chaves iguais as daqui, so que seus valores sendo as listas 
      //correspondentes aos seus valores
    ];
  }
}