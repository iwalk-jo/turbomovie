import 'package:flutter/material.dart';
import 'package:turbomovie_app/services/api_manager.dart';
import 'package:turbomovie_app/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'model/moviesinfo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> _welcome;

  @override
  void initState() {
    _welcome = APIManager().getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Turbo'),
      ),
      body: Container(
        child: FutureBuilder<Welcome>(
          future: _welcome,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.movies.length,
                  itemBuilder: (context, index) {
                    var movie = snapshot.data.data.movies[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Row(
                          children: <Widget>[
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1),
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    movie.largeCoverImage,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  Text(movie.title,
                                      style: mediumTextStyle,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis),
                                  SizedBox(height: 10),
                                  RatingBarIndicator(
                                    rating:
                                        double.parse(movie.rating?.toString()),
                                    itemBuilder: (_, __) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                      );
                                    },
                                    itemSize: 30,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    movie.genres.toString(),
                                    style: smallTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // color: Colors.white,
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
