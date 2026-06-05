import 'package:flutter/material.dart';

import 'products_screen.dart';
import 'admin_orders_screen.dart';
import 'my_orders_screen.dart';
import 'wishlist_screen.dart';
class HomeScreen extends StatelessWidget {
  final List cartItems;
  final List wishlistItems;

  const HomeScreen({
    super.key,
    required this.cartItems,
    required this.wishlistItems,
  });
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(
          "Community Store",
        ),

        actions: [

          // My Orders
          IconButton(

            icon: Icon(
              Icons.receipt_long,
            ),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      MyOrdersScreen(),
                ),
              );
            },
          ),

          // Admin Orders
          IconButton(

            icon: Icon(
              Icons.admin_panel_settings,
            ),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      AdminOrdersScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: Container(

        decoration: BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,

            colors: [

              Color(0xFF6C63FF),

              Color(0xFFF5F7FB),
            ],
          ),
        ),

        child: Padding(

          padding:
          const EdgeInsets.all(16),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              SizedBox(height: 10),

              Text(

                "Welcome 👋",

                style: TextStyle(

                  fontSize: 30,

                  fontWeight:
                  FontWeight.bold,

                  color: Colors.white,
                ),
              ),

              SizedBox(height: 5),

              Text(

                "Order your daily essentials",

                style: TextStyle(

                  fontSize: 16,

                  color: Colors.white70,
                ),
              ),

              SizedBox(height: 25),

              // Search Bar
              Container(

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(
                      18),

                  boxShadow: [

                    BoxShadow(

                      color:
                      Colors.black12,

                      blurRadius: 8,

                      offset: Offset(0, 3),
                    )
                  ],
                ),

                child: TextField(

                  decoration:
                  InputDecoration(

                    hintText:
                    "Search products",

                    prefixIcon:
                    Icon(Icons.search),

                    border:
                    InputBorder.none,

                    contentPadding:
                    EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              Expanded(

                child: GridView.count(

                  crossAxisCount: 2,

                  crossAxisSpacing: 18,

                  mainAxisSpacing: 18,

                  children: [

                    // Food Card
                    GestureDetector(

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) =>
                                ProductsScreen(
                                  cartItems: cartItems,
                                  wishlistItems: wishlistItems,
                                ),
                          ),
                        );
                      },

                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(
                              24),

                          boxShadow: [

                            BoxShadow(

                              color:
                              Colors.black12,

                              blurRadius: 10,

                              offset:
                              Offset(0, 5),
                            )
                          ],
                        ),

                        child: Column(

                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,

                          children: [

                            CircleAvatar(

                              radius: 35,

                              backgroundColor:
                              Color(0xFFEEEAFE),

                              child: Icon(

                                Icons.fastfood,

                                size: 40,

                                color:
                                Color(
                                    0xFF6C63FF),
                              ),
                            ),

                            SizedBox(height: 15),

                            Text(

                              "Food",

                              style: TextStyle(

                                fontSize: 22,

                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(

                              "Fresh & tasty",

                              style: TextStyle(

                                color:
                                Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Grocery Card
                    GestureDetector(

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) =>
                                ProductsScreen(
                                  cartItems: cartItems,
                                  wishlistItems: wishlistItems,
                                )                          ),
                        );
                      },

                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(
                              24),

                          boxShadow: [

                            BoxShadow(

                              color:
                              Colors.black12,

                              blurRadius: 10,

                              offset:
                              Offset(0, 5),
                            )
                          ],
                        ),

                        child: Column(

                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,

                          children: [

                            CircleAvatar(

                              radius: 35,

                              backgroundColor:
                              Color(0xFFFFF3E0),

                              child: Icon(

                                Icons.shopping_bag,

                                size: 40,

                                color:
                                Colors.orange,
                              ),
                            ),

                            SizedBox(height: 15),

                            Text(

                              "Groceries",

                              style: TextStyle(

                                fontSize: 22,

                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(

                              "Daily essentials",

                              style: TextStyle(

                                color:
                                Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Snacks Card
                    GestureDetector(

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) =>
                                ProductsScreen(
                                  cartItems: cartItems,
                                  wishlistItems: wishlistItems,
                                )
                          ),
                        );
                      },

                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(
                              24),

                          boxShadow: [

                            BoxShadow(

                              color:
                              Colors.black12,

                              blurRadius: 10,

                              offset:
                              Offset(0, 5),
                            )
                          ],
                        ),

                        child: Column(

                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,

                          children: [

                            CircleAvatar(

                              radius: 35,

                              backgroundColor:
                              Color(0xFFFFEBEE),

                              child: Icon(

                                Icons.cookie,

                                size: 40,

                                color: Colors.red,
                              ),
                            ),

                            SizedBox(height: 15),

                            Text(

                              "Snacks",

                              style: TextStyle(

                                fontSize: 22,

                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(

                              "Quick bites",

                              style: TextStyle(

                                color:
                                Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Vegetables Card
                    GestureDetector(

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) =>
                                ProductsScreen(
                                  cartItems: cartItems,
                                  wishlistItems: wishlistItems,
                                )
                          ),
                        );
                      },

                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(
                              24),

                          boxShadow: [

                            BoxShadow(

                              color:
                              Colors.black12,

                              blurRadius: 10,

                              offset:
                              Offset(0, 5),
                            )
                          ],
                        ),

                        child: Column(

                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,

                          children: [

                            CircleAvatar(

                              radius: 35,

                              backgroundColor:
                              Color(0xFFE8F5E9),

                              child: Icon(

                                Icons.eco,

                                size: 40,

                                color: Colors.green,
                              ),
                            ),

                            SizedBox(height: 15),

                            Text(

                              "Vegetables",

                              style: TextStyle(

                                fontSize: 22,

                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(

                              "Fresh farm items",

                              style: TextStyle(

                                color:
                                Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




