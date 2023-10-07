import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, int> selectedItems = {
    'Pullover': 0,
    'T-Shirt': 0,
    'Pants': 0,
    // Add more products if needed
  };

  Map<String, double> itemPrices = {
    'Pullover': 5.0,
    'T-Shirt': 6.0,
    'Pants': 9.0,
    // Add more prices if needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // No color for the AppBar
        elevation: 0, // No shadow
        title: Text(
          'MY BAG',
          style: TextStyle(
            fontSize: 24, // Increased font size
            fontWeight: FontWeight.bold,
            color: Colors.black, // Black text color
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                buildItemBox(
                  'https://placekitten.com/200/200', // Placeholder image link
                  'Pullover',
                  'Color: Gray, Size: L',
                  itemPrices['Pullover']!,
                ),
                SizedBox(height: 20),
                buildItemBox(
                  'https://placekitten.com/200/201', // Placeholder image link
                  'T-Shirt',
                  'Color: Blue, Size: M',
                  itemPrices['T-Shirt']!,
                ),
                SizedBox(height: 20),
                buildItemBox(
                  'https://placekitten.com/200/202', // Placeholder image link
                  'Pants',
                  'Color: Black, Size: XL',
                  itemPrices['Pants']!,
                ),
                // Add more products if needed
              ],
            ),
          ),
          // Total amount
          buildTotalAmount(),
          // Checkout button at the bottom
          buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget buildItemBox(String imageUrl, String name, String details, double price) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // A light grey color
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          // Left 30% for the image
          Container(
            width: 0.3 * MediaQuery.of(context).size.width,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15.0),
          // Right 70% for the name, details, price, and buttons
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name in bold
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Line showing color and size
                Text(
                  details,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                // Divider for separation
                Divider(
                  color: Colors.black,
                ),
                // Quantity and price
                Row(
                  children: [
                    buildCircularButton(
                      icon: Icons.remove,
                      onPressed: () {
                        _decreaseQuantity(name);
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      selectedItems[name].toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 10),
                    buildCircularButton(
                      icon: Icons.add,
                      onPressed: () {
                        _increaseQuantity(name);
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\$$price',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCircularButton({required IconData icon, required Function() onPressed}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget buildTotalAmount() {
    double totalAmount = 0.0;
    selectedItems.forEach((itemName, quantity) {
      totalAmount += quantity * itemPrices[itemName]!;
    });

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // A light grey color
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Amount:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$$totalAmount',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckoutButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          _showCongratulatorySnackBar(context);
        },
        child: Text('CHECK OUT'),
      ),
    );
  }

  void _increaseQuantity(String itemName) {
    setState(() {
      selectedItems[itemName] = selectedItems[itemName]! + 1;
    });
  }

  void _decreaseQuantity(String itemName) {
    if (selectedItems[itemName]! > 0) {
      setState(() {
        selectedItems[itemName] = selectedItems[itemName]! - 1;
      });
    }
  }

  void _showCongratulatorySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Congratulations! Your order is confirmed.'),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
