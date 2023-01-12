import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBackgroundBody(context),
            _buildBody(context),
          ],
        ),
      ),
    );
  }

  _buildBackgroundBody(BuildContext context) {
    return Stack(children: [
      Container(
        height: 320,
        decoration: const BoxDecoration(
          color: Color(0xFF1E0220),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
    ]);
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Container(
            margin: const EdgeInsets.only( top: 10),
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Buzz',
            style: TextStyle(
              letterSpacing: 1.3,
              color: Color(0xFFAFB2B5),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'A Real Bitter Experience.',
            style: TextStyle(
              letterSpacing: 1.3,
              color: Color(0xFFAFB2B5),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 30),
          Center(
              child: Stack(
            children: [
              Center(
                child: Container(
                  height: 230,
                  width: 160,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 190,
                  width: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/beer.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          )),
          const SizedBox(height: 20),
          // description
          const Text(
            'Description',
            style: TextStyle(
              color: Color(0xFF1E2022),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.Pellentesque and mauris nunc, tincidunt in magna vel, vulputate bad gravida nulla.',
            style: TextStyle(
              letterSpacing: 1.1,
              wordSpacing: 1.5,
              height: 1.5,
              color: Color(0xFF1E2022),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'First Brewed',
            style: TextStyle(
              color: Color(0xFF1E2022),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '09/2007',
            style: TextStyle(
              color: Color(0xFF77838F),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Getting know your beer better',
            style: TextStyle(
              color: Color(0xFF1E2022),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 52 * 10,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return beerDetails();
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Row beerDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: const [
            Text(
              'ABV',
              style: TextStyle(
                color: Color(0xFF1E2022),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '4.5',
              style: TextStyle(
                letterSpacing: 1.1,
                wordSpacing: 1.5,
                height: 1.5,
                color: Color(0xFF1E2022),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
