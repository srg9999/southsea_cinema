import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);
    });

    testWidgets('Displays movie cards with titles and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(MovieCard), findsNWidgets(3));
      expect(find.text('Dracula 2025'), findsOneWidget);
      expect(find.text('£15.99'), findsOneWidget);
      expect(find.text('Dragon ball Z: battle of gods'), findsOneWidget);
      expect(find.text('£9.99'), findsOneWidget);
      expect(find.text('Dragon ball super: broly'), findsOneWidget);
      expect(find.text('£8.50'), findsOneWidget);
      expect(find.text('Book now'), findsNWidgets(3));
    });

    testWidgets('Booking flow opens the selected movie and adds to order',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(find.text('Book now').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Dracula 2025 (18+)'), findsOneWidget);
      expect(find.text('Tickets (£15.99 each)'), findsOneWidget);

      await tester.tap(find.text('Add to order'));
      await tester.pump();
      expect(find.text('Movie added to order!'), findsOneWidget);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.byType(HomeView), findsOneWidget);

      await tester.tap(find.text('Book now').at(1));
      await tester.pumpAndSettle();

      expect(find.text('Dragon ball Z: battle of gods (18+)'), findsOneWidget);
      expect(find.text('Tickets (£9.99 each)'), findsOneWidget);
      expect(find.text('Movie added to order!'), findsNothing);
    });
  });
}
