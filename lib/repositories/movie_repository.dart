import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
          id: "1",
          title: "Dracula 2025",
          synopsis:
              "When a 15th-century prince denounces God after the loss of his wife he inherits an eternal curse: he becomes Dracula.",
          ageRating: "18+",
          screeningTime: "2 hours 9 minutes",
          ticketPrice: 15.99,
          imagePath: "assets/images/dracula.jpg"),
      Movie(
          id: "2",
          title: "Dragon ball Z: battle of gods",
          synopsis:
              "beerus wakes up from a long slumber to challenge the strongest warrior in the universe, Goku, to a battle that will determine the fate of the world. ",
          ageRating: "18+",
          screeningTime: "1 hour 25 minutes",
          ticketPrice: 9.99,
          imagePath: "assets/images/dbz.jpg"),
      Movie(
          id: "3",
          title: "Dragon ball super: broly",
          synopsis:
              "Goku and Vegeta face Broly, a Saiyan warrior unlike any fighter they have faced before.",
          ageRating: "12+",
          screeningTime: "1 hour 40 minutes",
          ticketPrice: 8.50,
          imagePath: "assets/images/broly.jpg"),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
