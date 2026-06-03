import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/firestore_service.dart';
import 'add_product_screen.dart';
import 'cart_screen.dart';

class ProductsScreen extends StatefulWidget {
  final List cartItems;

  const ProductsScreen({

    super.key,

    required this.cartItems,
  });
  @override
  State<ProductsScreen> createState() =>
      _ProductsScreenState();
}

class _ProductsScreenState
    extends State<ProductsScreen> {

  final FirestoreService
  firestoreService =
  FirestoreService();


  String searchText = "";

  String selectedCategory = "All";

  List categories = [

    "All",
    "Food",
    "Groceries",
    "Snacks",
    "Vegetables"
  ];

  void addToCart(product) {

    setState(() {

      widget.cartItems.add({

        'name': product['name'],

        'price': product['price'],
      });
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(

      SnackBar(

        backgroundColor:
        Colors.green,

        content: Text(
          "${product['name']} Added To Cart 🛒",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("Products"),

        centerTitle: true,

        actions: [

          // Add Product
          IconButton(

            icon: Icon(Icons.add),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      AddProductScreen(),
                ),
              );
            },
          ),

          // Cart
          IconButton(

            icon:
            Icon(Icons.shopping_cart),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      CartScreen(

                        cartItems:
                        widget.cartItems,
                      ),
                ),
              );
            },
          )
        ],
      ),

      body: Container(

        decoration: BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,

            colors: [

              Color(0xFFF5F7FB),

              Color(0xFFEDEBFF),
            ],
          ),
        ),

        child: Column(

          children: [

            // Search
            Padding(

              padding:
              const EdgeInsets.all(14),

              child: TextField(

                decoration:
                InputDecoration(

                  hintText:
                  "Search Products",

                  prefixIcon:
                  Icon(Icons.search),

                  filled: true,

                  fillColor:
                  Colors.white,

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                        18),

                    borderSide:
                    BorderSide.none,
                  ),
                ),

                onChanged: (value) {

                  setState(() {

                    searchText =
                        value.toLowerCase();
                  });
                },
              ),
            ),

            // Categories
            SizedBox(

              height: 50,

              child: ListView.builder(

                scrollDirection:
                Axis.horizontal,

                itemCount:
                categories.length,

                itemBuilder:
                    (context, index) {

                  final category =
                  categories[index];

                  return Padding(

                    padding:
                    const EdgeInsets
                        .symmetric(
                      horizontal: 6,
                    ),

                    child: ChoiceChip(

                      label:
                      Text(category),

                      selected:
                      selectedCategory ==
                          category,

                      selectedColor:
                      Color(0xFF6C63FF),

                      labelStyle:
                      TextStyle(

                        color:
                        selectedCategory ==
                            category

                            ? Colors.white

                            : Colors.black,
                      ),

                      onSelected: (value) {

                        setState(() {

                          selectedCategory =
                              category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10),

            // Products
            Expanded(

              child:
              StreamBuilder<QuerySnapshot>(

                stream:
                firestoreService
                    .getProducts(),

                builder:
                    (context, snapshot) {

                  if (!snapshot.hasData) {

                    return Center(

                      child:
                      CircularProgressIndicator(),
                    );
                  }

                  final products =
                      snapshot.data!.docs;

                  final filteredProducts =

                  products.where((product) {

                    String name =

                    product['name']
                        .toString()
                        .toLowerCase();

                    String category =

                    product['category']
                        .toString();

                    bool matchesSearch =

                    name.contains(
                        searchText);

                    bool matchesCategory =

                        selectedCategory ==
                            "All" ||

                            category ==
                                selectedCategory;

                    return matchesSearch &&
                        matchesCategory;

                  }).toList();

                  if (filteredProducts
                      .isEmpty) {

                    return Center(

                      child: Text(

                        "No Products Found",

                        style: TextStyle(

                          fontSize: 20,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  return GridView.builder(

                    padding:
                    const EdgeInsets.all(
                        14),

                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 2,

                      childAspectRatio:
                      0.70,

                      crossAxisSpacing:
                      14,

                      mainAxisSpacing:
                      14,
                    ),

                    itemCount:
                    filteredProducts.length,

                    itemBuilder:
                        (context, index) {

                      final product =
                      filteredProducts[
                      index];

                      String productName =

                      product['name']
                          .toString()
                          .toLowerCase();

                      String imagePath =
                          "assets/images/default.png";

                      if (productName ==
                          "milk") {

                        imagePath =
                        "assets/images/milk.png";

                      } else if (productName ==
                          "pizza") {

                        imagePath =
                        "assets/images/pizza.png";

                      } else if (productName ==
                          "burger") {

                        imagePath =
                        "assets/images/burger.png";

                      } else if (productName ==
                          "chips") {

                        imagePath =
                        "assets/images/chips.png";

                      } else if (productName ==
                          "bread") {

                        imagePath =
                        "assets/images/bread.png";

                      } else if (productName ==
                          "brinjal") {

                        imagePath =
                        "assets/images/brinjal.png";

                      } else if (productName ==
                          "cake") {

                        imagePath =
                        "assets/images/cake.png";

                      } else if (productName ==
                          "millets") {

                        imagePath =
                        "assets/images/millets.png";

                      } else if (productName ==
                          "tomato") {

                        imagePath =
                        "assets/images/tomato.png";

                      } else if (productName ==
                          "rice") {

                        imagePath =
                        "assets/images/riceBag.png";
                      }

                      return Container(

                        decoration:
                        BoxDecoration(

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

                        child: Padding(

                          padding:
                          const EdgeInsets
                              .all(12),

                          child: Column(

                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [

                              Expanded(

                                child: Center(

                                  child:
                                  Image.asset(

                                    imagePath,

                                    fit: BoxFit.contain,

                                    errorBuilder:
                                        (
                                        context,
                                        error,
                                        stackTrace) {

                                      return Icon(

                                        Icons.image,

                                        size: 70,

                                        color:
                                        Colors.grey,
                                      );
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(

                                product['name'],

                                maxLines: 1,

                                overflow:
                                TextOverflow
                                    .ellipsis,

                                style: TextStyle(

                                  fontSize: 18,

                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(

                                "₹${product['price']}",

                                style: TextStyle(

                                  fontSize: 18,

                                  fontWeight:
                                  FontWeight.bold,

                                  color:
                                  Colors.green,
                                ),
                              ),

                              SizedBox(height: 5),

                              Container(

                                padding:
                                EdgeInsets.symmetric(

                                  horizontal: 10,
                                  vertical: 4,
                                ),

                                decoration:
                                BoxDecoration(

                                  color:
                                  Color(
                                      0xFFEDEBFF),

                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      20),
                                ),

                                child: Text(

                                  product['category'],

                                  style: TextStyle(

                                    fontSize: 12,

                                    color:
                                    Color(
                                        0xFF6C63FF),

                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                              ),

                              SizedBox(height: 12),

                              SizedBox(

                                width:
                                double.infinity,

                                child:
                                ElevatedButton.icon(

                                  style:
                                  ElevatedButton.styleFrom(

                                    backgroundColor:
                                    Color(
                                        0xFF6C63FF),

                                    foregroundColor:
                                    Colors.white,

                                    shape:
                                    RoundedRectangleBorder(

                                      borderRadius:
                                      BorderRadius.circular(
                                          16),
                                    ),
                                  ),

                                  onPressed: () {

                                    addToCart(
                                        product);
                                  },

                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                  ),

                                  label: Text(
                                    "Add",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}