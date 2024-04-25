import 'package:auth_package/core/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/helpers/environments/environment_config.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class OrderWebsocket implements Disposable {
  final AuthStore authStore;

  late final WebSocketChannel channel;
  OrderWebsocket({required this.authStore}) {
    channel = IOWebSocketChannel.connect(Uri.parse(EnvironmentConfig.WSS_ORDER),
        headers: {'Authorization': authStore.user!.accessToken});
  }

  @override
  void dispose() {
    channel.sink.close();
  }
}
