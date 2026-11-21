import 'package:flutter/material.dart';

import 'package:studio_core/app/arcade_stage.dart';
import 'package:studio_core/app/game_api.dart';
import 'package:studio_core/core/game_rules.dart';
import 'casual_engine.dart';
import 'casual_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-096-merge-fruits',
  title: const ['Meyve Birleştir', 'Merge Fruits', 'Früchte Verschmelzen', 'Fusiona Frutas', 'Fusion de Fruits'],
  tagline: const ['Aynı meyveleri çarpıştır, dev karpuzu yap!', 'Drop, bump and merge up to the giant melon!', 'Gleiche Früchte verschmelzen!', '¡Une frutas iguales!', 'Fusionnez les fruits !'],
  seedColor: const Color(0xFFF77F00),
  icon: Icons.apple,
  rules: MergeFruitsRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => CasualSim((ctx.generated as GeneratedLevel<CasualLevel>).puzzle),
    paint: paintCasual,
    sound: casualSound,
    boosterIcon: Icons.vibration,
    boosterLabel: (l) => l == 'tr' ? 'Salla' : 'Shake',
    howTo: const ['Basılı tutup sağa sola kaydır, bırakınca meyve düşer. Aynı meyveler birleşir.', 'Hold and slide to aim, release to drop. Equal fruits merge.', 'Halten zum Zielen, loslassen.', 'Mantén para apuntar, suelta.', 'Maintenez pour viser, relâchez.'],
  ),
  tutorial: const [
    TutorialStep(Icons.swap_horiz, ['Kaydırarak nişan al, bırak.', 'Slide to aim, release to drop.', 'Zielen und loslassen.', 'Apunta y suelta.', 'Visez et relâchez.']),
    TutorialStep(Icons.merge_type, ['İki aynı meyve büyük meyve olur.', 'Two equal fruits make a bigger one.', 'Zwei gleiche = größer.', 'Dos iguales = una mayor.', 'Deux égaux = plus gros.']),
    TutorialStep(Icons.warning, ['Kırmızı çizgiyi aşma!', 'Stay below the red line!', 'Unter der roten Linie!', '¡Bajo la línea roja!', 'Sous la ligne rouge !']),
  ],
);
