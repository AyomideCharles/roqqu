class CoinData {
  final String symbol;
  final String name;
  final String iconPath;
  final double price;
  final double change;

  CoinData({
    required this.symbol,
    required this.name,
    required this.iconPath,
    required this.price,
    required this.change,
  });

  bool get isPositive => change >= 0;
  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  String get formattedChange =>
      '${isPositive ? '+' : ''}${change.toStringAsFixed(2)}%';
}
