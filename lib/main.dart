import 'package:flutter/material.dart';

void main() {
  runApp(AmazonCloneApp());
}

class AmazonCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          CategoryList(),
          SizedBox(height: 20),
          Expanded(
            child: ProductList(),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(category: 'Electronics', imageUrl: 'img/ele.jpg'),
          CategoryItem(category: 'Books', imageUrl: 'img/book.jpg'),
          CategoryItem(category: 'Clothing', imageUrl: 'img/cloth.jpg'),
          CategoryItem(category: 'Beauty', imageUrl: 'img/beauty.jpg'),
          CategoryItem(category: 'Home', imageUrl: 'img/home.jpg'),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;
  final String imageUrl;

  const CategoryItem({Key? key, required this.category, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen(category: category)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imageUrl,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(category),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductItem(
          productName: 'Product $index',
          price: (index + 1) * 10.0,
          imageUrl: 'https://via.placeholder.com/150',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailsScreen(productName: 'Product $index')),
            );
          },
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final String productName;
  final double price;
  final String imageUrl;
  final VoidCallback onTap;

  const ProductItem({Key? key, required this.productName, required this.price, required this.imageUrl, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(
                "https://cdn.shopify.com/s/files/1/0070/7032/files/product-label-design.jpg?v=1680902906",
                width: 100,
                height: 100,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('\$$price'),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Text('Products under $category category'),
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String productName;

  const ProductDetailsScreen({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Center(
        child: Text('Details of $productName'),
      ),
    );
  }
}
