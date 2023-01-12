import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:non_stop_io/blocs/home/home_bloc.dart';
import 'package:non_stop_io/core/route_constants.dart';
import 'package:non_stop_io/models/product.model.dart';
import 'package:non_stop_io/services/product_repo.dart';
import 'package:non_stop_io/ui/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeBloc? _homeBloc;

  @override
  void initState() {
    super.initState();
    // _homeBloc = BlocProvider.of<HomeBloc>(context);
    // _homeBloc?.add(FetchHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E0220),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.black),
                onPressed: () {
                  context.pushNamed(RouteName.profileScreen);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.all(8),
            child: const Text(
              'Time to Cheers! Choose your beer...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: products(),
            // child: BlocListener<HomeBloc, HomeState>(
            //   listener: (context, state) {
            //     if (state is HomeError) {
            //       Fluttertoast.showToast(
            //           msg: state.message,
            //           toastLength: Toast.LENGTH_SHORT,
            //           gravity: ToastGravity.BOTTOM,
            //           timeInSecForIosWeb: 1,
            //           backgroundColor: Colors.red,
            //           textColor: Colors.white,
            //           fontSize: 16.0);
            //     }
            //   },
            //   child: BlocBuilder<HomeBloc, HomeState>(
            //     bloc: _homeBloc,
            //     builder: (context, state) {
            //       if (state is HomeInitial) {
            //         return buildInitial();
            //       } else if (state is HomeLoading) {
            //         return buildLoading();
            //       } else if (state is HomeLoaded) {
            //         return products(state.products);
            //       } else if (state is HomeError) {
            //         return buildError(state.message);
            //       } else {
            //         return buildError('Something went wrong');
            //       }
            //     },
            //   ),
          ),
        ],
      ),
    );
  }

// Products
  Widget products() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.63,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return productCard(context);
      },
    );
  }

  // Initial
  Widget buildInitial() {
    return const Center(
      child: Text('Initial..', style: TextStyle(color: Colors.white)),
    );
  }

  // On Loading Screen
  Widget buildLoading() {
    return const Center(
        child: Text('Loading...', style: TextStyle(color: Colors.white)));
  }

  // Error
  Widget buildError(String message) {
    return Center(
      child: Text(message, style: const TextStyle(color: Colors.white)),
    );
  }
}
