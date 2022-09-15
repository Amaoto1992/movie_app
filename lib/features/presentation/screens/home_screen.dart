import 'package:movie_app/features/data/remote/movies_api/movies_api.dart';
import 'package:movie_app/features/domain/entities/populars_entity.dart';
import 'package:movie_app/features/presentation/screens/screens.dart';
import 'package:movie_app/features/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final popularProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Movies in cinema'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              Divider(),
              MovieSlider(
                title: 'Populars', movies: moviesProvider.popularMovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
