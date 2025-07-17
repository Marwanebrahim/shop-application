import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imagespageview = [
    'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    "https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?q=80&w=1167&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D ",
  ];
  List<String> imageCaption = ["page view1", "page view2", "page view3"];
  List<String> imagesgrid = [
    "assets/i1.jpg",
    "assets/i2.jpg",
    "assets/i3.jpg",
    "assets/i4.jpg",
    "assets/i5.jpg",
    "assets/i6.jpg",
  ];
  List<String> gridtext = [
    "grid text1",
    "grid text2",
    "grid text3",
    "grid text4",
    "grid text5",
    "grid text6",
  ];
  List<String> listtext = [
    "list text1",
    "list text2",
    "list text3",
    "list text4",
    "list text5",
  ];
  List<String> listboutton = [
    "list boutton1",
    "list boutton2",
    "list boutton3",
    "list boutton4",
    "list boutton5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          tr("app bar"),
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 1, 124, 224),
                const Color.fromARGB(208, 141, 1, 165),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(tr("home page1"), style: TextStyle(fontSize: 30)),
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.9,
            child: PageView.builder(
              itemCount: imagespageview.length,
              // controller: PageController(viewportFraction: 0.85),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(2, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(imagespageview[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Text(
                              tr(imageCaption[index]),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Text(tr("home page2"), style: TextStyle(fontSize: 30)),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 800,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: imagesgrid.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.asset(
                                imagesgrid[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                  // ignore: deprecated_member_use
                                  color: const Color.fromARGB(255, 92, 2, 104).withOpacity(0.75),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                       ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: const Color.fromARGB(255, 252, 251, 250),
                                  behavior: SnackBarBehavior.floating,
                                  content: Row(
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_checkout,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          tr("grid view7"),
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart_checkout_outlined,
                                    color: const Color.fromARGB(255, 236, 232, 232),
                                  ),
                                  padding: EdgeInsets.all(6),
                                  constraints: BoxConstraints(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: Text(
                                gridtext[index],
                                style: TextStyle(
                                  fontSize: 30,
                                  backgroundColor: Colors.white,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(tr("home page3"), style: TextStyle(fontSize: 30)),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 1750,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      tr(listtext[index]),
                      style: TextStyle(fontSize: 30),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                        backgroundColor: const Color.fromARGB(
                          218,
                          252,
                          103,
                          242,
                        ),
                      ),
                      child: Text(tr(listboutton[index]) ,style: TextStyle(fontSize: 20),),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
