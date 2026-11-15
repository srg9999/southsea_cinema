import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      final movie = Movie(
        id: 'jaws',
        title: 'Jaws',
        synopsis: 'A giant shark attacks a beach town.',
        ageRating: '12+',
        screeningTime: '2 hours 4 minutes',
        ticketPrice: 7.50,
        imagePath: 'assets/images/jaws.jpg',
      );

      expect(movie.id, 'jaws');
      expect(movie.title, 'Jaws');
      expect(movie.synopsis, 'A giant shark attacks a beach town.');
      expect(movie.ageRating, '12+');
      expect(movie.screeningTime, '2 hours 4 minutes');
      expect(movie.ticketPrice, 7.50);
      expect(movie.imagePath, 'assets/images/jaws.jpg');
    });

    test('formattedPrice shows pounds and pence', () {
      final wholePounds = Movie(
        id: 'alien',
        title: 'Alien',
        synopsis: 'A deadly alien hunts the crew of a spaceship.',
        ageRating: '15+',
        screeningTime: '1 hour 57 minutes',
        ticketPrice: 10,
        imagePath: 'assets/images/alien.jpg',
      );
      final withPence = Movie(
        id: 'jaws',
        title: 'Jaws',
        synopsis: 'A giant shark attacks a beach town.',
        ageRating: '12+',
        screeningTime: '2 hours 4 minutes',
        ticketPrice: 7.50,
        imagePath: 'assets/images/jaws.jpg',
      );

      expect(wholePounds.formattedPrice, '£10.00');
      expect(withPence.formattedPrice, '£7.50');
    });
  });
}
