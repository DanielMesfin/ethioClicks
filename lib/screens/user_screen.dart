import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:urban_restaurant/utils/colors.dart';
import 'package:urban_restaurant/models/restaurant_data.dart';
import 'package:urban_restaurant/widgets/list_of_restautant.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user_screen';

  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isAppBarExpanded = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          isAppBarExpanded) {
        setState(() {
          isAppBarExpanded = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !isAppBarExpanded) {
        setState(() {
          isAppBarExpanded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: const <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.white,
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('List of Restaurant',
                    style: TextStyle(color: Colors.black)),
                background: Image(
                  image: AssetImage("images/assets/ethioclickslogo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              child: ListOfOrders(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListOfOrders extends StatelessWidget {
  const ListOfOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: restaurantList.map((e) => RestaurantCard(resturnt: e)).toList(),
    );
  }
}
