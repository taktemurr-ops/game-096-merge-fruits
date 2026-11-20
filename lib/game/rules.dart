import '../core/arcade.dart';
import '../core/level_plan.dart';
import '../core/missions.dart';
import '../core/stats.dart';
import 'casual_engine.dart';

class MergeFruitsRules extends ArcadeRules<CasualLevel> {
  @override
  String get gameId => 'game-096-merge-fruits';

  @override
  List<String> get optionalMechanics => const [];

  @override
  List<GameStat> get gameStats => const [
        GameStat('merges', 'Birleştirme', 'Merges', scale: 1500),
        GameStat('big_fruits', 'Dev meyve', 'Big fruits', scale: 40),
        GameStat('best_fruit', 'En büyük meyve', 'Biggest fruit', scale: 11),
      ];

  @override
  List<MissionTemplate> get missionTemplates => const [
        MissionTemplate('merges', 'merges', [375, 750, 1500]),
        MissionTemplate('big_fruits', 'big_fruits', [5, 10, 20], coinReward: 80),
      ];

  @override
  CasualLevel generate(LevelSpec spec) => generateCasual(CasualKind.merge, spec);

  @override
  ArcadeMeta metaOf(CasualLevel l) => l.meta;

  @override
  ArcadeSim createSim(CasualLevel l) => CasualSim(l);

  @override
  ArcadeInput bot(ArcadeSim sim) => casualBot(sim);
}

ArcadeRules createRules() => MergeFruitsRules();
