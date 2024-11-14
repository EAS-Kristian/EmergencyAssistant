import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final TTSService _instance = TTSService._internal();
  factory TTSService() => _instance;
  TTSService._internal();

  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false;

  Future<void> initialize() async {
    await _flutterTts.setLanguage("en-GB");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.5);
  }

  Future<void> speak(String text) async {
    if (_isSpeaking) {
      await stop();
    }
    _isSpeaking = true;
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    _isSpeaking = false;
    await _flutterTts.stop();
  }
} 