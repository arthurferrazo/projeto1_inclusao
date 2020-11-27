import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'idoso_widget.dart';
import 'model/usuario.dart';
import 'model/anotacao.dart';

void main() async {
  //Registrar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      '/cadastro': (context) => TelaCadastro(),
      '/anotacao': (context) => TelaAnotacao(),
      '/cadastroanotacao': (context) => TelaCadastroAnotacao(),
      '/avaliacao': (context) => TelaAvaliacao()

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
              campoTexto('E-MAIL:', txtlogin),
              campoTexto('SENHA:', txtSenha),
              botaoEntrar(),
              botaoCadastro(),
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



          validator: (value){
            return (value.isEmpty) ? "Informe os dados de acesso" : null;
          },

        )
    );

  }

  Widget botaoCadastro(){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: RaisedButton(
          child: Text("CADASTRO",
            style:TextStyle(
                color:Colors.white,
                fontSize: 18
            ),
          ),
          color: Theme.of(context).primaryColor,



          onPressed: () async {
            Navigator.pushNamed(context, '/cadastro');

          }
      ),
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


        onPressed: () async {
          //validator.
          if (formKey.currentState.validate()){

//Teste de Login
            var db = FirebaseFirestore.instance;

            QuerySnapshot usr = await db.collection("usuarios")
                .where('email', isEqualTo: txtlogin.text)
                .where('senha', isEqualTo: txtSenha.text).get();

            if ( usr.docs.isEmpty ){

              Navigator.pushNamed(context, '/login');
              caixaDialogo(
                  'Usuário não encontrado'
              );

            }else{

              txtlogin.text = "";
              txtSenha.text = "";
              Navigator.pushNamed(context, '/Principal');
              caixaDialogo(
                  'Seja bem Vindo'
              );
            }


          }


        },

      ),
    );
  }


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
          backgroundColor: Colors.blue,
          actions: [

            IconButton(
              icon: Icon(Icons.comment, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/avaliacao',

                );
              },
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white,),
              onPressed: (){
                Navigator.pushNamed(
                  context, '/anotacao',

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
                color: Colors.blue,
                child: Text('Clique aqui e descubra!', style: TextStyle(color: Colors.white)),
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
                color: Colors.blue,
                child: Text('Clique aqui e descubra!', style: TextStyle(color: Colors.white)),
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
                color: Colors.blue,
                child: Text('Clique aqui e descubra!', style: TextStyle(color: Colors.white)),
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
                color: Colors.blue,
                child: Text('Clique aqui e descubra!', style: TextStyle(color: Colors.white)),
                onPressed: (){
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
                color: Colors.blue,
                child: Text('Clique aqui e descubra!', style: TextStyle(color: Colors.white)),
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
                child: Text("Software é um conjunto de instruções que devem ser seguidas e executadas por um mecanismo, seja ele um computador ou um aparato eletromecânico.", style: TextStyle(fontSize: 24)),
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
                child: Text("Hardware é todo componente físico, interno ou externo do seu computador ou celular, que determina do que um dispositivo é capaz e como você pode usá-lo. Embora dependa de um software para funcionar (e vice-versa), o hardware é um elemento a parte e igualmente importante.", style: TextStyle(fontSize: 24)),
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
                child: Text("Um algoritmo nada mais é que a descrição de um passo a passo para a realização de uma tarefa", style: TextStyle(fontSize: 24)),
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
                child: Text("Inclusão digital de idosos na sociedade brasileira é um avanço para a sociedade brasileira, como no passado o contato com a tecnologia era inexistente não havia a necessidade de se pensar no caso, por isso é um tema de extrema importância e um assunto totalmente atual.", style: TextStyle(fontSize: 24)),
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


// tela de cadastro


class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}


class _TelaCadastroState extends State<TelaCadastro> {

  var txtNome = TextEditingController();
  var txtSenha = TextEditingController();
  var txtEmail = TextEditingController();

  var db = FirebaseFirestore.instance;


  void getDocumentById(String id) async{


    await db.collection("usuarios").doc(id).get()
        .then( (res) {

      txtNome.text = res.data()['nome'];
      txtEmail.text = res.data()['email'];
      txtSenha.text = res.data()['senha'];

    });
  }



  @override
  Widget build(BuildContext context) {

    //Receber o ID do documento enviado da TelaPrincipal
    final String id = ModalRoute.of(context).settings.arguments;

    if (id != null){
      if (txtNome.text == '' && txtSenha.text == '' && txtEmail.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuários"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Column(children: [


            TextField(
              controller: txtNome,
              style:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Nome",
              ),
            ),
            SizedBox(
              height: 30,
            ),


            TextField(
              controller: txtEmail,
              style:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "E-mail",
              ),
            ),
            SizedBox(
              height: 30,
            ),


            TextField(
              controller: txtSenha,
              style:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Senha",
              ),
            ),
            SizedBox(
              height: 30,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("salvar",style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () async {

                      if ( id == null){

                        await db.collection("usuarios").add(
                            {
                              "nome" : txtNome.text,
                              "email" : txtEmail.text,
                              "senha" : txtSenha.text,
                            }
                        );
                      }else{

                        await db.collection("usuarios").doc(id).update(
                            {
                              "nome" : txtNome.text,
                              "email" : txtEmail.text,
                              "senha" : txtSenha.text,
                            }
                        );
                      }

                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("cancelar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ])),
      backgroundColor: Colors.white,
    );
  }
}


// Tela Cadastro
//
class TelaCadastroAnotacao extends StatefulWidget {
  @override
  _TelaCadastroAnotacaoState createState() => _TelaCadastroAnotacaoState();
}

class _TelaCadastroAnotacaoState extends State<TelaCadastroAnotacao> {

  var txtDescricao = TextEditingController();
  var db = FirebaseFirestore.instance;


  void getDocumentById(String id) async{


    await db.collection("anotacao").doc(id).get()
        .then( (res) {

      txtDescricao.text = res.data()['descricao'];

    });
  }



  @override
  Widget build(BuildContext context) {


    final String id = ModalRoute.of(context).settings.arguments;

    if (id != null){
      if (txtDescricao.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Anotações"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Column(children: [


            TextField(
              controller: txtDescricao,
              style:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Anotação:",
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("salvar",style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () async {

                      if ( id == null){
                        //INSERIR um novo documento na coleção
                        await db.collection("anotacao").add(
                            {
                              "descricao" : txtDescricao.text,

                            }
                        );
                      }else{
                        //ATUALIZAR os dados do documento
                        await db.collection("anotacao").doc(id).update(
                            {
                              "descricao" : txtDescricao.text,
                            }
                        );
                      }

                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("cancelar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ])),
      backgroundColor: Colors.white,
    );
  }
}

class TelaAnotacao extends StatefulWidget {
  @override
  _TelaAnotacaoState createState() => _TelaAnotacaoState();
}

class _TelaAnotacaoState extends State<TelaAnotacao> {

  var db = FirebaseFirestore.instance;
  List<Anotacao> anotacao = List();


  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState(){
    super.initState();

    listen?.cancel();
    listen = db.collection("anotacao").snapshots().listen((res) {


      setState(() {

        anotacao = res.docs.map(
                (e) => Anotacao.fromMap(e.data(),e.id) ).toList();
      });

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anotações"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


      body: StreamBuilder<QuerySnapshot>(
          stream: db.collection("anotacao").snapshots(),
          builder: (context,snapshot){

            switch(snapshot.connectionState){

              case ConnectionState.none:
                return Center(child: Text('Erro de conexão.'));
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return ListView.builder(
                    itemCount: anotacao.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(anotacao[index].descricao, style: TextStyle(fontSize: 24)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (){
                            //Apagar um documento
                            db.collection("anotacao").doc(anotacao[index].id).delete();
                          },
                        ),


                        onTap: (){
                          Navigator.pushNamed(
                              context,'/cadastroanotacao',
                              arguments: anotacao[index].id
                          );

                        },

                      );
                    }
                );
            }

          }
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/cadastroanotacao", arguments: null);
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}



class TelaAvaliacao extends StatefulWidget {
  @override
  _TelaAvaliacaoState createState() => _TelaAvaliacaoState();
}

class _TelaAvaliacaoState extends State<TelaAvaliacao> {



  var txtDescricao = TextEditingController();
  var db = FirebaseFirestore.instance;


  void getDocumentById(String id) async{


    await db.collection("avaliacao").doc(id).get()
        .then( (res) {

      txtDescricao.text = res.data()['descricao'];

    });
  }


  @override
  Widget build(BuildContext context) {


    final String id = ModalRoute.of(context).settings.arguments;

    if (id != null){
      if (txtDescricao.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Deixe aqui seu comentário "),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Column(children: [


            TextField(
              controller: txtDescricao,
              style:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Digite aqui seu comentário:",
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Enviar",style: TextStyle(color: Colors.white, fontSize: 24)),
                    onPressed: () async {

                      if ( id == null){

                        await db.collection("avaliacao").add(
                            {
                              "descricao" : txtDescricao.text,

                            }
                        );
                      }else{

                        await db.collection("avaliacao").doc(id).update(
                            {
                              "descricao" : txtDescricao.text,
                            }
                        );
                      }

                      Navigator.pop(context);

                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Voltar",
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ])),
      backgroundColor: Colors.white,
    );
  }
}




