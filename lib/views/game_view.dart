import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pipe_x/pipe_x.dart';
import '../controllers/game_hub.dart';
import '../models/game_state.dart';
import 'widgets/bird_widget.dart';
import 'widgets/pipe_widget.dart';
import 'widgets/ground_widget.dart';
import 'widgets/score_widget.dart';
import 'widgets/game_over_widget.dart';
import 'widgets/ready_screen_widget.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hub = context.read<GameHub>();
    FocusNode focusNode = FocusNode();
    focusNode.requestFocus();

    return Scaffold(
      body: KeyboardListener(
        focusNode: focusNode,
        onKeyEvent: (event) {
          if (event.physicalKey == PhysicalKeyboardKey.space) {
            hub.jump();
          }
          
        },
        child: GestureDetector(
          onTap: hub.jump,
          
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF4EC0CA),
                        Color(0xFF87CEEB),
                      ],
                    ),
                  ),
                ),
              ),
              Sink(
                pipe: hub.pipes,
                builder: (context, pipeList) {
                  return Stack(
                    children:
                        pipeList.map((pipe) => PipeWidget(pipe: pipe)).toList(),
                  );
                },
              ),
              Sink(
                pipe: hub.backgroundX,
                builder: (context, bgX) {
                  return GroundWidget(
                    y: hub.groundY,
                    height: GameHub.groundHeight,
                  );
                },
              ),
              Well(
                pipes: [
                  hub.birdX,
                  hub.birdY,
                  hub.birdRotation,
                  hub.birdAlive,
                ],
                builder: (context) {
                  final gameHub = context.read<GameHub>();
                  return BirdWidget(
                    x: gameHub.birdX.value,
                    y: gameHub.birdY.value,
                    rotation: gameHub.birdRotation.value,
                    isAlive: gameHub.birdAlive.value,
                  );
                },
              ),
              Sink(
                pipe: hub.score,
                builder: (context, scoreValue) {
                  return ScoreWidget(score: scoreValue);
                },
              ),
              Sink(
                pipe: hub.status,
                builder: (context, gameStatus) {
                  if (gameStatus == GameStatus.ready) {
                    return const ReadyScreenWidget();
                  }
                  return const SizedBox.shrink();
                },
              ),
              Well(
                pipes: [hub.status, hub.score, hub.highScore],
                builder: (context) {
                  final gameHub = context.read<GameHub>();
                  if (gameHub.status.value == GameStatus.gameOver) {
                    return GameOverWidget(
                      score: gameHub.score.value,
                      highScore: gameHub.highScore.value,
                      onRestart: gameHub.restart,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
