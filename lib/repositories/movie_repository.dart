import 'package:southsea_cinema/models/movie.dart';

class MovieRepository{
  List<Movie> getMovies(){
    return[
      Movie(
        id: "1",
        title: "Dracula",
        synopsis: "When a 15th-century prince denounces God after the loss of his wife he inherits an eternal curse: he becomes Dracula.",
        ageRating: "18+",
        screeningTime: "2 hours 9 minutes",
        ticketPrice: 15.99,
        imagePath: "assets/images/dracula.jpg"
      )
    ];
  }
  }
