import 'package:audioplayers/audioplayers.dart';

class MusicController {
  static AudioPlayer _player = AudioPlayer();
  static bool interruptor = false;

  MusicController._();

  static Future<void> changeMusic() async {
    _player.stop();
    _player.play(AssetSource('music/' + (interruptor ? 'battleMusic.mp3' : 'selectionMusic.mp3')));
    interruptor = !interruptor;
  }
  static void disposePlayer() { _player.dispose(); }
}