import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef OnDataCallback = void Function(
    String symbol, String price, String change);

class BinanceService {
  WebSocketChannel? _channel;
  Timer? _reconnectTimer;
  bool _isDisposed = false;

  List<String>? _symbols;
  OnDataCallback? _onData;
  Function(dynamic error)? _onError;
  Function()? _onDone;

  void connect({
    required List<String> symbols,
    required OnDataCallback onData,
    Function(dynamic error)? onError,
    Function()? onDone,
  }) {
    _symbols = symbols;
    _onData = onData;
    _onError = onError;
    _onDone = onDone;

    try {
      final streams = symbols.map((s) => '${s.toLowerCase()}@ticker').join('/');
      final url = 'wss://stream.binance.com:9443/stream?streams=$streams';

      print('Connecting to: $url');

      _channel = WebSocketChannel.connect(Uri.parse(url));

      _channel!.stream.listen(
        (event) {
          try {
            final data = jsonDecode(event);

            if (data['data'] != null) {
              final symbol = data['data']['s'] as String;
              final price = data['data']['c'] as String;
              final change = data['data']['P'] as String;

              onData(symbol, price, change);
            }
          } catch (e) {
            print('Error parsing WebSocket data: $e');
          }
        },
        onError: (error) {
          print('WebSocket error: $error');
          if (onError != null) onError(error);
          _scheduleReconnect();
        },
        onDone: () {
          print('WebSocket closed.');
          if (onDone != null) onDone();
          _scheduleReconnect();
        },
        cancelOnError: false,
      );
    } catch (e) {
      print('Connection error: $e');
      _scheduleReconnect();
    }
  }

  void _scheduleReconnect() {
    if (_isDisposed || _symbols == null) return;

    _reconnectTimer?.cancel();

    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      if (!_isDisposed && _symbols != null) {
        print('Attempting to reconnect...');
        connect(
          symbols: _symbols!,
          onData: _onData!,
          onError: _onError,
          onDone: _onDone,
        );
      }
    });
  }

  void disconnect() {
    _isDisposed = true;
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _channel = null;
  }
}
