import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String receivePicturs;
  final String receiveLabel;
  final String receiveSublabel;
  final String receivePreice;
  const Details(
      {super.key,
      required this.receivePicturs,
      required this.receiveLabel,
      required this.receiveSublabel,
      required this.receivePreice});
  @override
  State<StatefulWidget> createState() => DeepDetails();
}

class DeepDetails extends State<Details> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Ecommerce '),
            Text(
              'Ui',
              style: TextStyle(color: Colors.orange),
            ),
          ])),
      //Drawer
      endDrawer: const Drawer(),
      // bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            fontSize: 20,
          ),
          selectedItemColor: Colors.orange,
          selectedIconTheme: const IconThemeData(color: Colors.grey),
          showUnselectedLabels: false,
          currentIndex: x,
          onTap: (value) {
            x = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'shop'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ]),
      //body
      body: ListView(
        children: [
          Image.network(widget.receivePicturs),
          Text(widget.receiveLabel,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center),
          const SizedBox(height: 15),
          Text(widget.receiveSublabel,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center),
          const SizedBox(height: 15),
          Text(
            widget.receivePreice,
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Padding(
              padding: const EdgeInsets.all(70),
              child: Row(children: [
                const Text(
                  'color:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(width: 30),
                //forLightBlue color
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const Text('  LightBlue'),
                const SizedBox(width: 30),
                //for grey color
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.orange)),
                ),
                const Text('  Grey')
              ])),

          // Add to cart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: MaterialButton(
                color: Colors.black,
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                onPressed: () {},
                child: const Text('+ Add to cart')),
          ),
        ],
      ),
    );
  }
}
