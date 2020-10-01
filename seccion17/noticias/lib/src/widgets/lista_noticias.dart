import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:noticias/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticias(
          noticia: this.noticias[index],
          index: index,
        );
      },
    );
  }
}

class _Noticias extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticias({this.noticia, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(this.noticia, this.index),
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: miTema.accentColor),
          ),
          Text(
            '${noticia.source.name}',
          ),
        ],
      ),
    );
  }
}
