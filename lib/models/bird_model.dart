class BirdModel {
  double x;
  double y;
  double velocity;
  double rotation;
  bool isAlive;

  static const double gravity = 0.2;
  static const double jumpStrength = -3.5;
  static const double radius = 20.0;

  BirdModel({
    required this.x,
    required this.y,
    this.velocity = 0,
    this.rotation = 0,
    this.isAlive = true,
  });

  void jump() {
    if (isAlive) {
      velocity = jumpStrength;
    }
  }

  void update() {
    if (!isAlive) return;

    velocity += gravity;
    y += velocity;

    rotation = velocity * 3;
    if (rotation < -30) rotation = -30;
    if (rotation > 90) rotation = 90;

    if (y < 0) {
      y = 0;
      velocity = 0;
    }
  }

  bool checkGroundCollision(double groundY) {
    return y + radius >= groundY;
  }

  bool checkPipeCollision(PipeModel pipe) {
    final birdLeft = x - radius;
    final birdRight = x + radius;
    final birdTop = y - radius;
    final birdBottom = y + radius;

    if (birdRight > pipe.x && birdLeft < pipe.x + pipe.width) {
      if (birdTop < pipe.topHeight || birdBottom > pipe.bottomY) {
        return true;
      }
    }

    return false;
  }

  void die() {
    isAlive = false;
  }

  void reset(double initialX, double initialY) {
    x = initialX;
    y = initialY;
    velocity = 0;
    rotation = 0;
    isAlive = true;
  }

  BirdModel copyWith({
    double? x,
    double? y,
    double? velocity,
    double? rotation,
    bool? isAlive,
  }) {
    return BirdModel(
      x: x ?? this.x,
      y: y ?? this.y,
      velocity: velocity ?? this.velocity,
      rotation: rotation ?? this.rotation,
      isAlive: isAlive ?? this.isAlive,
    );
  }
}

class PipeModel {
  double x;
  final double width;
  final double topHeight;
  final double bottomY;
  final double bottomHeight;
  final double gap;
  bool scored;

  static const double speed = 3.0;

  PipeModel({
    required this.x,
    required this.width,
    required this.topHeight,
    required this.bottomY,
    required this.bottomHeight,
    required this.gap,
    this.scored = false,
  });

  factory PipeModel.random({
    required double x,
    required double gap,
    required double gameHeight,
    required double groundHeight,
  }) {
    const width = 60.0;
    const minHeight = 50.0;
    final maxHeight = gameHeight - groundHeight - gap - minHeight;
    final topHeight = minHeight +
        (maxHeight - minHeight) *
            (DateTime.now().millisecondsSinceEpoch % 1000) /
            1000;
    final bottomY = topHeight + gap;
    final bottomHeight = gameHeight - groundHeight - bottomY;

    return PipeModel(
      x: x,
      width: width,
      topHeight: topHeight,
      bottomY: bottomY,
      bottomHeight: bottomHeight,
      gap: gap,
    );
  }

  void update() {
    x -= speed;
  }

  bool isOffScreen() {
    return x + width < 0;
  }

  bool hasPassed(double birdX) {
    return !scored && birdX > x + width;
  }

  void markScored() {
    scored = true;
  }

  PipeModel copyWith({
    double? x,
    double? width,
    double? topHeight,
    double? bottomY,
    double? bottomHeight,
    double? gap,
    bool? scored,
  }) {
    return PipeModel(
      x: x ?? this.x,
      width: width ?? this.width,
      topHeight: topHeight ?? this.topHeight,
      bottomY: bottomY ?? this.bottomY,
      bottomHeight: bottomHeight ?? this.bottomHeight,
      gap: gap ?? this.gap,
      scored: scored ?? this.scored,
    );
  }
}
