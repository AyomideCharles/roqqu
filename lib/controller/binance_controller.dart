import 'package:get/get.dart';
import 'package:roqqu_task/models/coin_data_model.dart';
import 'package:roqqu_task/services/binance_web_socket.dart';

class BinanceController extends GetxController {
  final BinanceService _binanceService = BinanceService();

  final RxList<CoinData> coins = <CoinData>[].obs;
  final RxBool isConnected = false.obs;
  final RxBool isLoading = true.obs;

  final Map<String, Map<String, String>> _coinInfo = {
    'BTCUSDT': {'name': 'Bitcoin', 'icon': 'assets/icons/bitcoin.png'},
    'ETHUSDT': {'name': 'Ethereum', 'icon': 'assets/images/eth.png'},
    'BNBUSDT': {'name': 'Binance Coin', 'icon': 'assets/images/bnb.png'},
    'ADAUSDT': {'name': 'Cardano', 'icon': 'assets/images/ada.png'},
    'SOLUSDT': {'name': 'Solana', 'icon': 'assets/images/sol.png'},
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
