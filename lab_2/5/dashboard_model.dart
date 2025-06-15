// class DashboardModel {
//   List<Map<String, dynamic>> horizontalProducts = [
//     {
//       'name': 'Smartwatch',
//       'price': 199.99,
//       'imageUrl': 'https://via.placeholder.com/100x100?text=Smartwatch',
//     },
//     {
//       'name': 'Camera',
//       'price': 499.99,
//       'imageUrl': 'https://via.placeholder.com/100x100?text=Camera',
//     },
//     {
//       'name': 'Bluetooth Speaker',
//       'price': 89.99,
//       'imageUrl': 'https://via.placeholder.com/100x100?text=Speaker',
//     },
//     {
//       'name': 'Tablet',
//       'price': 299.99,
//       'imageUrl': 'https://via.placeholder.com/100x100?text=Tablet',
//     },
//   ];
//
//   List<Map<String, dynamic>> gridProducts = [
//     {
//       'name': 'Smartphone',
//       'description': 'Latest Android smartphone',
//       'price': 699.99,
//       'imageUrl': 'https://via.placeholder.com/150x150?text=Smartphone',
//     },
//     {
//       'name': 'Headphones',
//       'description': 'Wireless over-ear headphones',
//       'price': 129.99,
//       'imageUrl': 'https://via.placeholder.com/150x150?text=Headphones',
//     },
//     {
//       'name': 'Laptop',
//       'description': 'High performance laptop',
//       'price': 999.99,
//       'imageUrl': 'https://via.placeholder.com/150x150?text=Laptop',
//     },
//     {
//       'name': 'Monitor',
//       'description': 'Full HD 24" monitor',
//       'price': 199.99,
//       'imageUrl': 'https://via.placeholder.com/150x150?text=Monitor',
//     },
//   ];
//
//   List<Map<String, dynamic>> getHorizontalProducts() {
//     return horizontalProducts;
//   }
//
//   List<Map<String, dynamic>> getGridProducts() {
//     return gridProducts;
//   }
// }


class DashboardModel {
  List<Map<String, dynamic>> horizontalProducts = [
    {
      'name': 'Smartwatch',
      'price': 199.99,
      'imageUrl': 'https://via.placeholder.com/100x100?text=Smartwatch',
    },
    {
      'name': 'Camera',
      'price': 499.99,
      'imageUrl': 'https://via.placeholder.com/100x100?text=Camera',
    },
    {
      'name': 'Bluetooth Speaker',
      'price': 89.99,
      'imageUrl': 'https://via.placeholder.com/100x100?text=Speaker',
    },
    {
      'name': 'Tablet',
      'price': 299.99,
      'imageUrl': 'https://via.placeholder.com/100x100?text=Tablet',
    },
  ];

  List<Map<String, dynamic>> gridProducts = [
    {
      'name': 'Smartphone',
      'description': 'Latest Android smartphone',
      'price': 699.99,
      'imageUrl': 'https://via.placeholder.com/150x150?text=Smartphone',
    },
    {
      'name': 'Headphones',
      'description': 'Wireless over-ear headphones',
      'price': 129.99,
      'imageUrl': 'https://via.placeholder.com/150x150?text=Headphones',
    },
    {
      'name': 'Laptop',
      'description': 'High performance laptop',
      'price': 999.99,
      'imageUrl': 'https://via.placeholder.com/150x150?text=Laptop',
    },
    {
      'name': 'Monitor',
      'description': 'Full HD 24\" monitor',
      'price': 199.99,
      'imageUrl': 'https://via.placeholder.com/150x150?text=Monitor',
    },
  ];

  final List<Map<String, dynamic>> _cartItems = [];

  final List<String> _categories = [
    'Mobiles',
    'Electronics',
    'Fashion',
    'Home',
    'Grocery',
    'Appliances',
  ];

  List<Map<String, dynamic>> getHorizontalProducts() => horizontalProducts;

  List<Map<String, dynamic>> getGridProducts() => gridProducts;

  List<String> getCategories() => _categories;

  void addToCart(Map<String, dynamic> product) {
    final alreadyInCart = _cartItems.any((item) => item['name'] == product['name']);
    if (!alreadyInCart) {
      _cartItems.add(product);
    } else {
      // Optional: allow duplicates or update quantity
    }
  }

  void removeFromCart(Map<String, dynamic> product) {
    _cartItems.removeWhere((item) => item['name'] == product['name']);
  }

  List<Map<String, dynamic>> getCartItems() => _cartItems;

  int getCartCount() => _cartItems.length;
}
