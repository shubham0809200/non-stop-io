import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_stop_io/core/route_constants.dart';
import 'package:non_stop_io/models/product.model.dart';

Widget productCard(BuildContext context) {
  return InkWell(
    onTap: () => context.pushNamed(RouteName.productDetailsScreen),
    child: Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Container(
              width: double.infinity,
              height: 160,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: const [
                   Image(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.contain,
                  ),
                  Image(
                    image: AssetImage('assets/images/beer.png'),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // #1E2022
               const Text('Buzz',
                    style:  TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E2022))),
                const SizedBox(height: 10),
             const   Text('A light, crisp and bitter IPA brewed with English...',
                    style:  TextStyle(
                        letterSpacing: 1.1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF77838F))),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('ABV',
                            style:  TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1E2022))),
                         SizedBox(height: 3),
                        Text('4.5',
                            style:  TextStyle(
                                letterSpacing: 1.1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF77838F))),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('IBU',
                            style:  TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1E2022))),
                         SizedBox(height: 3),
                        Text('60',
                            style:  TextStyle(
                                letterSpacing: 1.1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF77838F))),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
