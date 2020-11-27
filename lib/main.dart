import 'dart:math';

import 'package:flutter/material.dart';

import 'idoso_widget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Inclusão Digital',
    initialRoute: '/login',
    routes: {
      '/login': (context) => TelaLogin(),
      '/Principal': (context) => TelaPrincipal(),
      '/Software': (context) => TelaSoftware(),
      '/Hardware': (context) => TelaHardware(),
      '/Algoritimo': (context) => TelaAlgoritimo(),
      '/Inclusao': (context) => TelaInclusao(),
      '/Projeto': (context) => TelaProjeto(),
      '/anotacao': (context) => TelaAnotacao()
    },
  ));
}


class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {


  var formKey = GlobalKey<FormState>();


  var txtlogin = TextEditingController();
  var txtSenha = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inclusão digital'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {

                setState(() {
                  txtlogin.text = "";
                  txtSenha.text = "";
                });

              })
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),

        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.computer, size: 60, color: Theme.of(context).primaryColor),
              Icon(Icons.people_outline, size: 120, color: Colors.grey),
              campoTexto('LOGIN:', txtlogin),
              campoTexto('SENHA:', txtSenha),
              botaoEntrar(),
            ],
          ),
        ),

      ),
    );
  }

  Widget campoTexto(rotulo, controle){

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(

          keyboardType: TextInputType.number,
          //Habilitar campo para senha
          //obscureText: true,

          style: TextStyle(
              color:Theme.of(context).primaryColor,
              fontSize: 30
          ),
          decoration: InputDecoration(
            labelText: rotulo,
            labelStyle: TextStyle(color: Colors.black,
                fontSize: 18
            ),
          ),

          controller: controle,

          //Validação do valor fornecedido

          validator: (value){
            return (value.isEmpty) ? "Informe os dados de acesso" : null;
          },

        )
    );

  }


  Widget botaoEntrar(){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: RaisedButton(
        child: Text("Entrar",
          style:TextStyle(
              color:Colors.white,
              fontSize: 18
          ),
        ),
        color: Theme.of(context).primaryColor,

        //
        // Evento ocorrera ao  clicar no botão
        //
        onPressed: (){
          //validator.
          if (formKey.currentState.validate()){


            setState(() {
              if (txtlogin.text == 'arthur' ){
                if(txtSenha.text == '123'){
                  Navigator.pushNamed(context, '/Principal');
                  caixaDialogo(
                      'Seja bem Vindo'
                  ); }
                else {
                  txtlogin.text = "";
                  txtSenha.text = "";
                  Navigator.pushNamed(context, '/login');
                  caixaDialogo(
                      'ERRO! Tente novamente'
                  );


                }} else {
                txtlogin.text = "";
                txtSenha.text = "";
                Navigator.pushNamed(context, '/login');
                caixaDialogo(
                    'ERRO! Tente novamente'
                );


              }
            });
          }


        },

      ),
    );
  }

  //
  // Caixa de Diálogo para exibição de mensagens
  //
  caixaDialogo(msg){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Mensagem!',style:TextStyle(fontSize: 12)),
            content: Text(msg, style:TextStyle(fontSize: 24)),
            actions: [
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('fechar')
              )
            ],
          );
        }
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Principal"),
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/anotacao',

                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/Principal',

                );
              },
            ),




          ],

        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("MENU", style: TextStyle(fontSize: 44)),

              ),
              Icon(Icons.menu, size: 40, color: Theme.of(context).primaryColor),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("Meu projeto", style: TextStyle(fontSize: 24)),
              ),
              RaisedButton(
                child: Text('Clique aqui e descubra!'),
                onPressed: (){
                  Navigator.pushNamed(
                    context, '/Projeto',

                  );

                },
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("O que é Software?", style: TextStyle(fontSize: 24)),
              ),
              RaisedButton(
                child: Text('Clique aqui e descubra!'),
                onPressed: (){
                  Navigator.pushNamed(
                    context, '/Software',

                  );

                },
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("O que é Hardware?", style: TextStyle(fontSize: 24)),
              ),
              RaisedButton(
                child: Text('Clique aqui e descubra!'),
                onPressed: (){
                  Navigator.pushNamed(
                    context, '/Hardware',

                  );

                },
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("O que é Algoritimo?", style: TextStyle(fontSize: 24)),
              ),
              RaisedButton(
                child: Text('Clique aqui e descubra!'),
                onPressed: (){
                  //Abrir a Tela de Resultado
                  Navigator.pushNamed(
                    context, '/Algoritimo',

                  );

                },
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("A importância da inclusão digital!", style: TextStyle(fontSize: 24)),
              ),
              RaisedButton(
                child: Text('Clique aqui e descubra!'),
                onPressed: (){
                  Navigator.pushNamed(
                    context, '/Inclusao',

                  );

                },
              ),
            ],
          ),
        )

    );
  }
}

class TelaSoftware extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Software"),
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/anotacao',

                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/Principal',

                );
              },
            ),




          ],
        ),



        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("Afinal, o que é software?", style: TextStyle(fontSize: 44)),

              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("descrição do que é", style: TextStyle(fontSize: 24)),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                alignment: Alignment.center,
                child:
                idosoWidget("/images/software.jpg"),
              ),
            ],
          ),
        )

    );
  }
}
class TelaHardware extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hardware"),
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/anotacao',

                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/Principal',

                );
              },
            ),




          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("Afinal, o que é Hardware?", style: TextStyle(fontSize: 44)),

              ),
              Container(
                alignment: Alignment.center,
                child: Text("descrição do que é", style: TextStyle(fontSize: 24)),
              ),
              Container(
                alignment: Alignment.center,
                child:
                idosoWidget("/images/hardware.jpg"),
              ),
            ],
          ),
        )

    );
  }
}

class TelaAlgoritimo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Algoritimo"),
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/anotacao',

                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/Principal',

                );
              },
            ),




          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text("Afinal, o que é algoritimo?", style: TextStyle(fontSize: 44)),

              ),
              Container(
                alignment: Alignment.center,
                child: Text("descrição do que é", style: TextStyle(fontSize: 24)),
              ),
              Container(
                alignment: Alignment.center,
                child:
                idosoWidget("/images/Algoritimo.jpg"),
              ),
            ],
          ),
        )

    );
  }
}

class TelaProjeto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Projeto"),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                child: Text("Afinal, o que é Projeto?", style: TextStyle(fontSize: 44)),

              ),
              Container(
                alignment: Alignment.center,
                child: Text("descrição do que é: o aplicativo é baseado na pesquisa cientifica no qual estou trabalhando para verificar a inclusão digital no brasil", style: TextStyle(fontSize: 24)),
              ),
              Container(
                alignment: Alignment.center,
                child:
                idosoWidget("/images/projeto.jpg"),
              ),
            ],
          ),
        )

    );
  }
}
class TelaInclusao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inclusão"),
          actions: [
            IconButton(
              icon: Icon(Icons.add, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/anotacao',

                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/Principal',

                );
              },
            ),




          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text("Qual a importância da inclusão digital", style: TextStyle(fontSize: 44)),

              ),
              Container(
                alignment: Alignment.center,
                child: Text("descrição do que é", style: TextStyle(fontSize: 24)),
              ),
              Container(
                alignment: Alignment.center,
                child:
                idosoWidget("/images/inclusao.jpg"),
              ),
            ],
          ),
        )

    );
  }
}


//
// ListView com Separeted
//
class TelaAnotacao extends StatefulWidget {
  @override
  _Anotacao createState() => _Anotacao();
}

class _Anotacao extends State<TelaAnotacao> {

  //Lista Dinâmica que contem os dados que serão exibidos
  List<String> items = [];

  var txtAnotacao = TextEditingController();
  var key = GlobalKey<ScaffoldState>();

  @override
  void initState(){

    items.add("Hardware é tudo aquilo que você pode bater");
    items.add("Software é tudo aquilo que você xinga");
    items.add("Algoritimo é o que me deixa careca");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faça suas anotações'),
      ),

      key: key,

      body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: txtAnotacao,
                      decoration: InputDecoration(
                          labelText: 'Anotacão',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0.1)
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.blue,),
                    onPressed: (){

                      setState(() {
                        items.add(txtAnotacao.text);
                        txtAnotacao.text = '';

                        key.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Anotação adicionada'),
                              duration: Duration(seconds: 1),
                            )
                        );
                      });

                    },
                  )
                ],
              ),
              SizedBox(height: 20),


              Expanded(
                child: ListView.separated(

                    itemBuilder: (context, index){
                      return Container(
                          child: ListTile(
                            leading: Icon(Icons.slideshow),
                            title: Text(items[index], style: TextStyle(fontSize: 24)),

                            onLongPress: (){

                              setState(() {
                                items.removeAt(index);
                                key.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text('Anotação removida com sucesso.'),
                                      duration: Duration(seconds: 4),
                                    )
                                );

                              });

                            },

                          )
                      );
                    },

                    separatorBuilder: (context,index){
                      return Divider(
                          thickness: 1,
                          color: Colors.blue
                      );
                    },

                    itemCount: items.length

                ),
              ),
            ],
          )
      ),

    );
  }
}

