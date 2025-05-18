class CartItem {
  final String id;
  final String title;
  final String imagePath;
  final int quantity;
  final double oldPrice;
  final double newPrice;

  CartItem({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.quantity,
    required this.oldPrice,
    required this.newPrice,
  });
}
