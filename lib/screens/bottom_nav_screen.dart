  import 'package:flutter/material.dart';

  import 'home_screen.dart';
  import 'cart_screen.dart';
  import 'wishlist_screen.dart';
  import 'my_orders_screen.dart';
  import 'profile_screen.dart';

  class BottomNavScreen extends StatefulWidget {
    const BottomNavScreen({super.key});

    @override
    State<BottomNavScreen> createState() =>
        _BottomNavScreenState();
  }

  class _BottomNavScreenState
      extends State<BottomNavScreen> {

    int currentIndex = 0;

    // Shared Lists
    List cartItems = [];
    List wishlistItems = [];

    @override
    Widget build(BuildContext context) {

      final List<Widget> pages = [

        HomeScreen(
          cartItems: cartItems,
          wishlistItems: wishlistItems,
        ),

        CartScreen(
          cartItems: cartItems,
        ),

        WishlistScreen(
          wishlistItems: wishlistItems,
        ),

        MyOrdersScreen(),

        const ProfileScreen(),
      ];

      return Scaffold(

        body: pages[currentIndex],

        bottomNavigationBar: Container(

          margin:
          const EdgeInsets.all(14),

          decoration: BoxDecoration(

            borderRadius:
            BorderRadius.circular(30),

            boxShadow: [

              BoxShadow(

                color:
                Colors.black.withOpacity(0.1),

                blurRadius: 15,

                offset:
                const Offset(0, 5),
              )
            ],
          ),

          child: ClipRRect(

            borderRadius:
            BorderRadius.circular(30),

            child: BottomNavigationBar(

              currentIndex:
              currentIndex,

              onTap: (index) {

                setState(() {

                  currentIndex = index;
                });
              },

              type:
              BottomNavigationBarType.fixed,

              backgroundColor:
              Colors.white,

              selectedItemColor:
              const Color(0xFF6C63FF),

              unselectedItemColor:
              Colors.grey,

              selectedLabelStyle:
              const TextStyle(
                fontWeight:
                FontWeight.bold,
              ),

              items: const [

                BottomNavigationBarItem(

                  icon: Icon(Icons.home),

                  label: "Home",
                ),

                BottomNavigationBarItem(

                  icon:
                  Icon(Icons.shopping_cart),

                  label: "Cart",
                ),

                BottomNavigationBarItem(

                  icon:
                  Icon(Icons.favorite),

                  label: "Wishlist",
                ),

                BottomNavigationBarItem(

                  icon:
                  Icon(Icons.receipt_long),

                  label: "Orders",
                ),

                BottomNavigationBarItem(

                  icon:
                  Icon(Icons.person),

                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      );
    }
  }