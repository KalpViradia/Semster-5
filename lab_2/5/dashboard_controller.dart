// import 'package:advance_flutter_lab/lab_2/5/utils/import_export.dart';
//
// class DashboardController {
//   final DashboardModel _model = DashboardModel();
//
//   List<Map<String, dynamic>> getHorizontalProducts() {
//     return _model.getHorizontalProducts();
//   }
//
//   List<Map<String, dynamic>> getGridProducts() {
//     return _model.getGridProducts();
//   }
// }

import 'package:advance_flutter_lab/lab_2/5/utils/import_export.dart';

  class DashboardController {
    final DashboardModel _model = DashboardModel();

    List<Map<String, dynamic>> getHorizontalProducts() {
      return _model.getHorizontalProducts();
    }

    List<Map<String, dynamic>> getGridProducts() {
      return _model.getGridProducts();
    }

    List<String> getCategories() {
      return _model.getCategories();
    }

    void addToCart(Map<String, dynamic> product) {
      _model.addToCart(product);
    }

    void removeFromCart(Map<String, dynamic> product) {
      _model.removeFromCart(product);
    }

    List<Map<String, dynamic>> getCartItems() {
      return _model.getCartItems();
    }

    int getCartCount() {
      return _model.getCartCount();
    }
  }
