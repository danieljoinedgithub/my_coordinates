import 'dart:async';
import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  StreamSubscription<Position>? _positionSubscription;

  /// Verifica se os serviços de localização estão ativados no dispositivo.
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Verifica e solicita permissões de localização, se necessário.
  /// Retorna true se as permissões forem concedidas.
  Future<bool> checkAndRequestPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false; // Permissão negada.
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false; // Permissões permanentemente negadas.
    }

    return true; // Permissões concedidas.
  }

  /// Recupera a posição atual do dispositivo.
  /// Lança uma exceção se as permissões não forem concedidas ou se os serviços de localização estiverem desativados.
  Future<Position> getCurrentPosition() async {
    if (!await isLocationServiceEnabled()) {
      throw Exception("Serviços de localização estão desativados.");
    }

    if (!await checkAndRequestPermissions()) {
      throw Exception("Permissões de localização não foram concedidas.");
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  /// Inicia o tacking ao vivo da localização.
  /// Retorna um stream de objetos Position.
  Stream<Position> startLiveTracking({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 1,
    
  }) {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilter,
      ),
    );
  }

  /// Inscreve-se para rastreamento ao vivo e fornece atualizações via callback.
  void subscribeToPositionUpdates({
    required void Function(Position) onPositionUpdate,
    required void Function(Object) onError,
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 10,
  }) {
    if (_positionSubscription != null) {
      stopLiveTracking();
    }

    _positionSubscription = startLiveTracking(
      accuracy: accuracy,
      distanceFilter: distanceFilter,
    ).listen(onPositionUpdate, onError: onError);
  }

  /// Cancela a inscrição do rastreamento ao vivo.
  void stopLiveTracking() {
    _positionSubscription?.cancel();
    _positionSubscription = null;
  }

  /// Verifica se o rastreamento ao vivo está ativo.
  bool isTrackingActive() {
    return _positionSubscription != null;
  }
}
