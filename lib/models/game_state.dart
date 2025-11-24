import 'bird_model.dart';

enum GameStatus {
  ready,
  playing,
  gameOver,
}

class GameState {
  final GameStatus status;
  final int score;
  final int highScore;
  final BirdModel bird;
  final List<PipeModel> pipes;
  final double backgroundX;
  final int pipeTimer;

  final double gameWidth;
  final double gameHeight;
  final double groundHeight;
  static const double pipeGap = 150.0;
  static const double pipeInterval = 90.0;
  static const double backgroundSpeed = 1.0;

  const GameState({
    required this.status,
    required this.score,
    required this.highScore,
    required this.bird,
    required this.pipes,
    required this.backgroundX,
    required this.pipeTimer,
    required this.gameWidth,
    required this.gameHeight,
    required this.groundHeight,
  });

  factory GameState.initial({
    required double gameWidth,
    required double gameHeight,
  }) {
    const groundHeight = 100.0;
    return GameState(
      status: GameStatus.ready,
      score: 0,
      highScore: 0,
      bird: BirdModel(
        x: gameWidth * 0.25,
        y: gameHeight * 0.5,
      ),
      pipes: [],
      backgroundX: 0,
      pipeTimer: 0,
      gameWidth: gameWidth,
      gameHeight: gameHeight,
      groundHeight: groundHeight,
    );
  }

  double get groundY => gameHeight - groundHeight;

  GameState copyWith({
    GameStatus? status,
    int? score,
    int? highScore,
    BirdModel? bird,
    List<PipeModel>? pipes,
    double? backgroundX,
    int? pipeTimer,
    double? gameWidth,
    double? gameHeight,
    double? groundHeight,
  }) {
    return GameState(
      status: status ?? this.status,
      score: score ?? this.score,
      highScore: highScore ?? this.highScore,
      bird: bird ?? this.bird,
      pipes: pipes ?? this.pipes,
      backgroundX: backgroundX ?? this.backgroundX,
      pipeTimer: pipeTimer ?? this.pipeTimer,
      gameWidth: gameWidth ?? this.gameWidth,
      gameHeight: gameHeight ?? this.gameHeight,
      groundHeight: groundHeight ?? this.groundHeight,
    );
  }
}
