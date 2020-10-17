import 'package:flutter/material.dart';

class idosoWidget extends StatelessWidget {
  //atributo
  final String foto;

  //construtor
  idosoWidget(this.foto) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400], width: 1),
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    foto,
                    scale: 1.0,
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
