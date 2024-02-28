

import 'package:flutter/material.dart';
import 'package:try_flutter/details.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => First();
}

class First extends State<MyApp> {
  List picturs = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlFqEHnqz5EJbv6b_dY0DR6klC7yawFpYauugKF25P4qX74fPQPY4KM2odtAratAZ69TU&usqp=CAU',
    'https://nilephone.net/wp-content/uploads/2022/06/FK88-smart-watch-FK-88.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr7AZI1MX5fA2rSQ4TTGXFdiWlcTqHy_HBPg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYdmMOSRccKin3UBvTlnAJka7QVfOVFcMSjg&usqp=CAU'
  ];
  List<String> label = [
    'Head phone',
    'Smart hand watch',
    'Smart phone',
    'Laptop'
  ];

  List<String> sublabel = [
    '2B (HP234) Headphone',
    'hand watch',
    'Hd screen',
    'msi modern 14'
  ];

  List<String> priece = ['\$100', '\$400', '\$500', '\$300'];
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'profile'),
            ]),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(children: [
              // search
              const Row(children: [
                Expanded(
                    flex: 7,
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder())),
                    )),
                Expanded(child: Icon(Icons.menu, size: 35))
              ]),
              const SizedBox(height: 20),
              const Text('Categories',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              //main categories
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(radius: 35, child: Icon(Icons.man, size: 30)),
                    CircleAvatar(
                        radius: 35, child: Icon(Icons.woman_2, size: 30)),
                    CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 35,
                        child: Icon(Icons.electric_bolt_rounded, size: 30)),
                    CircleAvatar(
                        radius: 35, child: Icon(Icons.sports, size: 30))
                  ]),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 20),
                    Text('Men'),
                    SizedBox(width: 35),
                    Text('Women'),
                    SizedBox(width: 25),
                    Text('Electronic'),
                    SizedBox(width: 18),
                    Text('Hobbies'),
                    SizedBox(width: 10),
                  ]),
              const SizedBox(height: 20),
              const Text('Best selling',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              //item briefely details
              GridView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                return Details(
                                  receivePicturs: picturs[index],
                                  receiveLabel: label[index],
                                  receiveSublabel: sublabel[index],
                                  receivePreice: priece[index],
                                );
                              }));
                            },
                            child: Image.network(picturs[index]),
                          ),
                          Text(label[index],
                              style: const TextStyle(fontSize: 20)),
                          Text(sublabel[index],
                              style: const TextStyle(color: Colors.grey)),
                          Text(priece[index],
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ]);
                  },
                  itemCount: picturs.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 50,
                      mainAxisExtent: 300,
                      crossAxisCount: 2)),
            ])));
  }
}
