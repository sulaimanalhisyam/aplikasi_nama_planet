import 'package:aplikasi_nama_planet/Planet_Data.dart';
import 'package:aplikasi_nama_planet/Planet_Detail.dart';
import 'package:flutter/material.dart';

class PlanetHome extends StatefulWidget {
  @override
  _PlanetHomeState createState() => _PlanetHomeState();
}

class _PlanetHomeState extends State<PlanetHome> {
  List<PlanetData> _planetdatalist = List<PlanetData>();
  double _screenWidthAdjusment;

  @override
  void initState() {
    _planetdatalist = PlanetData().createPlanetData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _screenWidthAdjusment = MediaQuery.of(context).size.width - 48.0 - 64.0;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Planet')),
      body: SafeArea(
        child: ListView.builder(
            itemExtent: 180.0,
            itemCount: _planetdatalist.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      fullscreenDialog: true,
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return PlanetDetail(
                            PlanetData: PlanetData(
                                judul: _planetdatalist[index].judul,
                                desc: _planetdatalist[index].desc,
                                gambar: _planetdatalist[index].gambar,
                                materialColor:
                                    _planetdatalist[index].materialColor));
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      }));
                },
                child: Card(
                  margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'background' + _planetdatalist[index].judul,
                        child: Container(
                          color: _planetdatalist[index].materialColor,
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Hero(
                          tag: 'gambar' + _planetdatalist[index].judul,
                          child: Image.network(_planetdatalist[index].gambar,
                              height: 80.0, fit: BoxFit.fitWidth),
                        ),
                      ),
                      Positioned(
                        top: 96.0,
                        left: 16.0,
                        child: Hero(
                          tag: 'judul' + _planetdatalist[index].judul,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              _planetdatalist[index].judul,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16.0,
                        top: 114.0,
                        child: Hero(
                            tag: 'desc' + _planetdatalist[index].judul,
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                _planetdatalist[index].desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
