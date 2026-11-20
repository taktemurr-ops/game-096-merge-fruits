import 'package:flutter_test/flutter_test.dart';
import 'package:game_096_merge_fruits/core/arcade.dart';
import 'package:game_096_merge_fruits/core/level_plan.dart';
import 'package:game_096_merge_fruits/game/casual_engine.dart';
import 'package:game_096_merge_fruits/game/rules.dart';

void main() {
  final rules = MergeFruitsRules();
  final planner = LevelPlanner(gameId: rules.gameId, optionalMechanics: rules.optionalMechanics);

  CasualSim fresh([int n = 1]) => CasualSim(rules.build(planner.spec(n)).puzzle);

  test('a stuck board costs a life and restarts the same board', () {
    final s = fresh(4);
    final g = s.goalText;
    s.boardFailed();
    expect(s.lives, 2);
    expect(s.goalText, g);
  });

  test('autopilot clears the first twelve boards without losing a life', () {
    for (var n = 1; n <= 12; n++) {
      final s = fresh(n);
      expect(runBot(s, rules.bot, 60 * 60 * 6).won, isTrue, reason: 'level $n');
      expect(s.lives, 3, reason: 'level $n');
    }
  });

  test('merge: two equal fruits that touch become the next fruit', () {
    final s = fresh() as MergeSim;
    s.fruits
      ..clear()
      ..add(Fruit(480, 1400, 2))
      ..add(Fruit(560, 1400, 2));
    for (var i = 0; i < 30; i++) {
      s.tick(ArcadeInput.idle);
    }
    expect(s.fruits.length, 1);
    expect(s.fruits.first.tier, 3);
  });
}
