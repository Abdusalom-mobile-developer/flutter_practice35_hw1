import 'package:flutter/material.dart';
import 'package:flutter_practice35_hw1/config/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  List<String> imagesList = [
    "https://i.pinimg.com/564x/3e/96/2d/3e962d68e1813b623247428ad4d38572.jpg",
    "https://i.pinimg.com/564x/54/31/72/543172681897d83399c872e0b765be50.jpg",
    "https://i.pinimg.com/564x/d5/69/56/d569566de03d0547256da03369ae56d6.jpg",
    "https://i.pinimg.com/564x/cd/a4/bf/cda4bfcae242bb08b5d81406656cc5a1.jpg",
    "https://i.pinimg.com/474x/62/fd/95/62fd958acf3cf854ce7f2c11fbd32f60.jpg",
    "https://i.pinimg.com/736x/63/fd/bb/63fdbbac743dfc7d3baf3ee2ab88b874.jpg",
    "https://i.pinimg.com/564x/aa/b0/33/aab033e0d184a141010fa693df0bca42.jpg",
    "https://i.pinimg.com/474x/c4/95/be/c495be8ff76224d8ddd280c0a9e98552.jpg",
    "https://i.pinimg.com/564x/84/3d/15/843d15e21cdb6c7418f1330d7793bc69.jpg",
    "https://i.pinimg.com/736x/6c/66/83/6c6683c97ef7a66cf963cf5ce51584a0.jpg",
    "https://i.pinimg.com/736x/da/e7/2b/dae72b1c17870b856caf5ba6a31888e3.jpg",
    "https://i.pinimg.com/564x/8c/e5/74/8ce5745c4ee5a367fb44f83b9b5ef43d.jpg",
    "https://i.pinimg.com/474x/18/b3/92/18b3927dc3b409b6afb42fa2a53ec673.jpg",
    "https://i.pinimg.com/474x/b0/f7/f6/b0f7f60d669ea671b21565f5c46df9f0.jpg",
    "https://i.pinimg.com/474x/25/c6/f3/25c6f3698575d22f6ed19fcf86a53140.jpg",
    "https://i.pinimg.com/474x/93/b0/29/93b029ae4e7df154db5faaa10579a2af.jpg",
    "https://i.pinimg.com/474x/6c/75/e5/6c75e5aa6173bc9a1768eeffd4431447.jpg",
    "https://i.pinimg.com/474x/a0/a3/57/a0a357281197e7c7bea13028eb461695.jpg"
  ];

  List<String> listOfViews = [
    '152.5K',
    '189.3K',
    '210.7K',
    '175.8K',
    '234.1K',
    '198.6K',
    '162.9K',
    '217.4K',
    '205.9K',
    '243.5K',
    '176.4K',
    '192.2K',
    '220.8K',
    '185.1K',
    '231.7K',
    '199.5K',
    '214.3K',
    '180.6K',
    '221.9K',
    '235.6K',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorsClass.black,
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "Live Wallpapers 4K",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {}, child: const Icon(Icons.notifications_outlined)),
          const SizedBox(
            width: 7,
          ),
          GestureDetector(
              onTap: () {}, child: const Icon(Icons.more_vert_rounded)),
          const SizedBox(width: 6),
        ],
        bottom: TabBar(
            controller: _controller,
            labelColor: ColorsClass.black,
            dividerColor: ColorsClass.black,
            indicatorPadding: const EdgeInsets.only(bottom: 5),
            dividerHeight: 1.4,
            indicatorColor: ColorsClass.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.read_more_rounded,
                  size: 26,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.favorite_outline_rounded,
                  size: 26,
                ),
              ),
            ]),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.4,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4),
        itemCount: imagesList.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imagesList[index]), fit: BoxFit.cover)),
          child: Container(
            alignment: AlignmentDirectional.bottomEnd,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(begin: FractionalOffset.bottomLeft, colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.3)
              ]),
            ),
            child: Row(
              children: [
                Text(
                  listOfViews[index],
                  style:
                      const TextStyle(fontSize: 16, color: ColorsClass.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
