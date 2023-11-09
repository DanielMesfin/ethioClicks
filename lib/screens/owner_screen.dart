import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urban_restaurant/utils/colors.dart';

class OwnerScreen extends StatefulWidget {
  @override
  _OwnerScreenState createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  ScrollController _scrollController = ScrollController();
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
      drawer: Drawer(child: DrawerScreen()),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: AppColors.white,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'List of Orders',
                style: TextStyle(color: Colors.black),
              ),
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
    );
  }
}

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Daniel Mesfin',
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              'danielmesfin@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ListOfOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red[200],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red[200],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red[200],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red[200],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red[200],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red[200],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red[200],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.red[200],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
