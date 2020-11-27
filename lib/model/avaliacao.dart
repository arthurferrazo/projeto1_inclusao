// MODELO DE DADOS para a coleção anotacao
//
class Avaliacao{

  String id;
  String descricao;
  Avaliacao(this.id,this.descricao);

  //Converter um DOCUMENTO em um OBJETO
  Avaliacao.fromMap(Map<String,dynamic> map, String id){

    //se id não for nulo, então this.id = id;
    //senão this.id = '';
    this.id = id ?? '';
    this.descricao = map['descricao'];

  }


}