//
// MODELO DE DADOS para a coleção Usuarios
//
class Usuarios{

  String id;
  String nome;
  String email;
  String senha;

  Usuarios(this.id,this.nome,this.email,this.senha);

  //Converter um DOCUMENTO em um OBJETO
  Usuarios.fromMap(Map<String,dynamic> map, String id){

    //se id não for nulo, então this.id = id;
    //senão this.id = '';
    this.id = id ?? '';
    this.nome = map['nome'];
    this.email = map['email'];
    this.senha = map['senha'];

  }


}