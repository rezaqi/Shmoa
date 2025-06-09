import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioNovelController extends ChangeNotifier {
  // playing audio

  bool _isPlay = false;
  bool _linerPlayer = false;
  bool _done = true;

// audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

// duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

//play the song
  @override
  play(String url) async {
    _isPlay = true;
    _linerPlayer = true;
    _done = false;
    notifyListeners();
    listenToDurtion();
    await _audioPlayer.play(UrlSource(url));
    _done = true;
    notifyListeners();
  }

//seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
    notifyListeners();
  }

// listen to duration
  void listenToDurtion() {
    // listen to total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;

      notifyListeners();
    });
    // listen to current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen to complete
    _audioPlayer.onPlayerComplete.listen((event) {});
  }
//dispase audio player

  @override
  pause() async {
    try {
      await _audioPlayer.pause();
      _isPlay = false;

      notifyListeners();
    } catch (e) {
      print("error in pause read $e");
    }
  }

  @override
  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
      _isPlay = false;
      _linerPlayer = false;
      _currentDuration = Duration.zero;
      _totalDuration = Duration.zero;

      notifyListeners();
    } catch (e) {
      print("error in stop read $e");
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  bool get isPlay => _isPlay;
  bool get linerPlayer => _linerPlayer;
  bool get done => _done;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// when back
  clearData() {
    _isPlay = false;
    _linerPlayer = false;
    _done = true;
  }
}
