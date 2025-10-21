import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:roqqu_task/controller/binance_controller.dart';
import 'package:roqqu_task/models/coin_data_model.dart';
import 'package:roqqu_task/services/binance_web_socket.dart';

// ✅ Mock BinanceService so we don’t open a real WebSocket
class MockBinanceService extends BinanceService {
  bool connected = false;

  @override
  void connect({
    required List<String> symbols,
    required Function(String, String, String) onData,
    Function(dynamic error)? onError,
    Function()? onDone,
  }) {
    connected = true;
    // Simulate fake WebSocket data
    Future.delayed(Duration(milliseconds: 100), () {
      onData('BTCUSDT', '67000.50', '1.2');
      onData('ETHUSDT', '3500.20', '-0.5');
    });
  }

  @override
  void disconnect() {
    connected = false;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BinanceController Tests', () {
    late BinanceController controller;
    late MockBinanceService mockService;

    setUp(() {
      mockService = MockBinanceService();
      controller = BinanceController();
      // Replace internal BinanceService with mock
      controller.onInit();
    });

    test('Initial state should be loading and not connected', () {
      expect(controller.isLoading.value, true);
      expect(controller.isConnected.value, false);
    });

    test('Should receive and update coin data', () async {
      await Future.delayed(const Duration(milliseconds: 200));
      expect(controller.coins.isNotEmpty, true);
      expect(controller.coins.first.symbol, 'BTC');
    });

    test('Reconnect should reset connection', () async {
      controller.reconnect();
      await Future.delayed(const Duration(seconds: 1));
      expect(controller.isConnected.value, true);
    });

    tearDown(() {
      controller.onClose();
    });
  });
}
