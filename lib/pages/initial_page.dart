import 'package:filme_flix/components/loading_movie_list.dart';
import 'package:filme_flix/components/movie_card.dart';
import 'package:filme_flix/components/movie_list_error.dart';
import 'package:filme_flix/repositories/movie_repository.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/movie_banner.png",
          fit: BoxFit.cover,
          height: 450,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        const Text(
          'Popular Movies',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        FutureBuilder(
          future: MovieRepository().getMovies(),
          builder: (ctx, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const LoadingMovieList();
            }
            if(snapshot.hasError){
              return MovieListError(onRetry: (){});
            }
            final movies = snapshot.data ?? [];

            return SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index){
                  return MovieCard(movie: movies[index]);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
