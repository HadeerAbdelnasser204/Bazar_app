class QuantityState {
  final int quantity;
  final double price;

  const QuantityState({required this.quantity, required this.price});

  double get total => quantity * price;
}
