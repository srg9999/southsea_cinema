import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns three movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 3);
    });

    test('getMovies contains the three movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie dracula = movies[0];
      expect(dracula.id, '1');
      expect(dracula.title, 'Dracula 2025');
      expect(dracula.ticketPrice, 15.99);
      expect(dracula.imagePath, isNotEmpty);

      final Movie dbz = movies[1];
      expect(dbz.id, '2');
      expect(dbz.title, 'Dragon ball Z: battle of gods');
      expect(dbz.ticketPrice, 9.99);
      expect(dbz.imagePath, isNotEmpty);

      final Movie broly = movies[2];
      expect(broly.id, '3');
      expect(broly.title, 'Dragon ball super: broly');
      expect(broly.ticketPrice, 8.50);
      expect(broly.imagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('1');

      expect(movie, isNotNull);
      expect(movie?.title, 'Dracula 2025');
      expect(movie?.ticketPrice, 15.99);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
