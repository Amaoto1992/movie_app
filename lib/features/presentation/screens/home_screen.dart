import 'package:movie_app/features/presentation/screens/screens.dart';
import 'package:movie_app/features/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              CardSwiper(),
              Divider(),
              MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
