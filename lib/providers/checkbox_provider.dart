import 'package:flutter/foundation.dart';

class CheckboxProvider with ChangeNotifier {
  bool _selectAll = false;
  final Set<String> _selectedProductIds = {};

  bool get selectAll => _selectAll;

  Set<String> get selectedProductIds => _selectedProductIds;

  void toggleSelectAll(bool value, List<String> allProductIds) {
    _selectAll = value;

    if (value) {
      _selectedProductIds.addAll(allProductIds);
    } else {
      _selectedProductIds.clear();
    }

    notifyListeners();
  }

  void toggleProductSelection(String productId) {
    if (_selectedProductIds.contains(productId)) {
      _selectedProductIds.remove(productId);
    } else {
      _selectedProductIds.add(productId);
    }

    notifyListeners();
  }

  bool isProductSelected(String productId) {
    return _selectedProductIds.contains(productId);
  }
}
