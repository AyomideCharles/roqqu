import 'package:get/get.dart';
import 'package:roqqu_task/services/binance_web_socket.dart';

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

class BinanceController extends GetxController {
  final BinanceService _binanceService = BinanceService();

  final RxList<CoinData> coins = <CoinData>[].obs;
  final RxBool isConnected = false.obs;
  final RxBool isLoading = true.obs;

  final Map<String, Map<String, String>> _coinInfo = {
    'BTCUSDT': {'name': 'Bitcoin', 'icon': 'assets/icons/bitcoin.png'},
    'ETHUSDT': {'name': 'Ethereum', 'icon': 'assets/icons/ethereum.png'},
    'BNBUSDT': {'name': 'Binance Coin', 'icon': 'assets/icons/bnb.png'},
    'ADAUSDT': {'name': 'Cardano', 'icon': 'assets/icons/cardano.png'},
    'SOLUSDT': {'name': 'Solana', 'icon': 'assets/icons/solana.png'},
  };

  final List<String> symbols = [
    'btcusdt',
    'ethusdt',
    'bnbusdt',
    'adausdt',
    'solusdt',
  ];

  @override
  void onInit() {
    super.onInit();
    _connectToWebSocket();
  }

  void _connectToWebSocket() {
    isLoading.value = true;

    _binanceService.connect(
      symbols: symbols,
      onData: (symbol, price, change) {
        isConnected.value = true;
        isLoading.value = false;

        final info = _coinInfo[symbol.toUpperCase()];
        if (info == null) return;

        final coinData = CoinData(
          symbol: symbol.replaceAll('USDT', '').replaceAll('usdt', ''),
          name: info['name']!,
          iconPath: info['icon']!,
          price: double.tryParse(price) ?? 0.0,
          change: double.tryParse(change) ?? 0.0,
        );

        final index = coins.indexWhere(
          (c) => c.symbol.toLowerCase() == coinData.symbol.toLowerCase(),
        );

        if (index != -1) {
          coins[index] = coinData;
        } else {
          coins.add(coinData);
        }
      },
      onError: (error) {
        print("WebSocket error: $error");
        isConnected.value = false;
      },
      onDone: () {
        print("WebSocket closed. Will reconnect...");
        isConnected.value = false;
      },
    );
  }

  void reconnect() {
    _binanceService.disconnect();
    Future.delayed(const Duration(seconds: 1), () {
      _connectToWebSocket();
    });
  }

  @override
  void onClose() {
    _binanceService.disconnect();
    super.onClose();
  }
}
