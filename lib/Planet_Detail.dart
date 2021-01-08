import 'package:aplikasi_nama_planet/Planet_Data.dart';
import 'package:flutter/material.dart';

class PlanetDetail extends StatefulWidget {
  final PlanetData;

  const PlanetDetail({Key key, this.PlanetData}) : super(key: key);

  @override
  _PlanetDetailState createState() => _PlanetDetailState();
}

class _PlanetDetailState extends State<PlanetDetail> {
  PlanetData _planetData;
  double _screenwidth;

  @override
  void initState() {
    _planetData = widget.PlanetData;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _screenwidth = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_planetData.judul}'),
        backgroundColor: _planetData.materialColor,
      ),
      body: SafeArea(
          child: Stack(
            children: [
              Hero(
                  tag: 'background' + _planetData.judul,
                  child: Container(
                    color: _planetData.materialColor,
                  )),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                height: 230.0,
                child: Hero(
                  tag: 'gambar' + _planetData.judul,
                  child: Image.network(_planetData.gambar, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 246.0,
                left: 16.0,
                child: Hero(
                    tag: 'judul' + _planetData.judul,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        _planetData.judul,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )),
              ),
              Positioned(
                top: 270.0,
                left: 16.0,
                right: 20,
                child: Hero(
                  tag: 'desc' + _planetData.judul,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(_planetData.desc,
                        maxLines: 20,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
