import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pipe_x/pipe_x.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bird_model.dart';
import '../models/game_state.dart';

class GameHub extends Hub {
  final double gameWidth;
  final double gameHeight;

  static const double groundHeight = 100.0;
  static const double pipeGap = 150.0;
  static const int pipeInterval = 120;
  static const double backgroundSpeed = 0.6;

  late final status = pipe(GameStatus.ready);
  late final score = pipe(0);
  late final highScore = pipe(0);
  late final birdX = pipe(0.0);
  late final birdY = pipe(0.0);
  late final birdVelocity = pipe(0.0);
  late final birdRotation = pipe(0.0);
  late final birdAlive = pipe(true);
  late final pipes = pipe<List<PipeModel>>([]);
  late final backgroundX = pipe(0.0);
  late final pipeTimer = pipe(0);

  Timer? _gameLoop;
  static const int fps = 60;
  static const Duration frameDuration = Duration(milliseconds: 1000 ~/ fps);

  GameHub({
    required this.gameWidth,
    required this.gameHeight,
  }) {
    _initialize();
  }

  double get groundY => gameHeight - groundHeight;

  void _initialize() {
    birdX.value = gameWidth * 0.25;
    birdY.value = gameHeight * 0.5;
    _loadHighScore();
  }

  Future<void> _loadHighScore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      highScore.value = prefs.getInt('flappy_bird_high_score') ?? 0;
    } catch (e) {
      debugPrint('Failed to load high score: $e');
    }
  }

  Future<void> _saveHighScore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('flappy_bird_high_score', highScore.value);
    } catch (e) {
      debugPrint('Failed to save high score: $e');
    }
  }

  void startGame() {
    if (status.value == GameStatus.ready ||
        status.value == GameStatus.gameOver) {
      status.value = GameStatus.playing;
      score.value = 0;
      birdX.value = gameWidth * 0.25;
      birdY.value = gameHeight * 0.5;
      birdVelocity.value = 0;
      birdRotation.value = 0;
      birdAlive.value = true;
      pipes.value = [];
      backgroundX.value = 0;
      pipeTimer.value = 0;

      _startGameLoop();
    }
  }

  void jump() {
    if (status.value == GameStatus.ready) {
      startGame();
    }

    if (status.value == GameStatus.playing && birdAlive.value) {
      birdVelocity.value = BirdModel.jumpStrength;
    }
  }

  void _startGameLoop() {
    _gameLoop?.cancel();
    _gameLoop = Timer.periodic(frameDuration, (_) {
      if (status.value == GameStatus.playing) {
        _updateGame();
      }
    });
  }

  void _stopGameLoop() {
    _gameLoop?.cancel();
    _gameLoop = null;
  }

  void _updateGame() {
    if (!birdAlive.value) return;

    birdVelocity.value += BirdModel.gravity;
    birdY.value += birdVelocity.value;

    birdRotation.value = (birdVelocity.value * 3).clamp(-30.0, 90.0);

    if (birdY.value < 0) {
      birdY.value = 0;
      birdVelocity.value = 0;
    }

    if (birdY.value + BirdModel.radius >= groundY) {
      _gameOver();
      return;
    }

    backgroundX.value -= backgroundSpeed;
    if (backgroundX.value <= -gameWidth) {
      backgroundX.value = 0;
    }

    pipeTimer.value++;
    if (pipeTimer.value >= pipeInterval) {
      final newPipe = PipeModel.random(
        x: gameWidth + 150,
        gap: pipeGap,
        gameHeight: gameHeight,
        groundHeight: groundHeight,
      );
      pipes.value = [...pipes.value, newPipe];
      pipeTimer.value = 0;
    }

    List<PipeModel> updatedPipes = [];
    int currentScore = score.value;

    for (final pipe in pipes.value) {
      pipe.update();

      if (_checkPipeCollision(pipe)) {
        _gameOver();
        return;
      }

      if (pipe.hasPassed(birdX.value)) {
        pipe.markScored();
        currentScore++;
      }

      if (!pipe.isOffScreen()) {
        updatedPipes.add(pipe);
      }
    }

    pipes.value = updatedPipes;
    score.value = currentScore;
  }

  bool _checkPipeCollision(PipeModel pipe) {
    final birdLeft = birdX.value - BirdModel.radius;
    final birdRight = birdX.value + BirdModel.radius;
    final birdTop = birdY.value - BirdModel.radius;
    final birdBottom = birdY.value + BirdModel.radius;

    if (birdRight > pipe.x && birdLeft < pipe.x + pipe.width) {
      if (birdTop < pipe.topHeight || birdBottom > pipe.bottomY) {
        return true;
      }
    }

    return false;
  }

  void _gameOver() {
    _stopGameLoop();

    birdAlive.value = false;
    status.value = GameStatus.gameOver;

    if (score.value > highScore.value) {
      highScore.value = score.value;
      _saveHighScore();
    }
  }

  void restart() {
    startGame();
  }

  @override
  void onDispose() {
    _stopGameLoop();
    super.onDispose();
  }
}
