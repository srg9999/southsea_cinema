import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
          color: cinemaBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${widget.movie.title} (${widget.movie.ageRating})',
                  style: cinemaHeaderStyle),
              Image.asset(
                widget.movie.imagePath,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
              Text(widget.movie.screeningTime),
              Text(widget.movie.synopsis),
              Text('Tickets (${widget.movie.formattedPrice} each)'),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Add to order button pressed');
                  setState(() {
                    _bookingMessage = 'Movie added to order!';
                  });
                },
                child: const Text('Add to order'),
              ),
              Text(_bookingMessage),
              DropdownMenu<int>(
                initialSelection: _ticketQuantity,
                onSelected: (int? value) {
                  if (value != null) {
                    setState(() {
                      _ticketQuantity = value;
                      debugPrint('Tickets selected: $_ticketQuantity');
                    });
                  }
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 1, label: '1'),
                  DropdownMenuEntry(value: 2, label: '2'),
                  DropdownMenuEntry(value: 3, label: '3'),
                  DropdownMenuEntry(value: 4, label: '4'),
                  DropdownMenuEntry(value: 5, label: '5'),
                ],
              ),
              Text('Tickets selected: $_ticketQuantity')
            ],
          )),
    );
  }
}
