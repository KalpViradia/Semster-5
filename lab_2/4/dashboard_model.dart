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
      'description': 'Full HD 24" monitor',
      'price': 199.99,
      'imageUrl': 'https://via.placeholder.com/150x150?text=Monitor',
    },
  ];

  List<Map<String, dynamic>> getHorizontalProducts() {
    return horizontalProducts;
  }

  List<Map<String, dynamic>> getGridProducts() {
    return gridProducts;
  }
}
