import Lake
open Lake DSL

package «sumoLean4» where
  -- keep this lightweight; no mathlib dependency

lean_lib SumoKif where
  roots := #[
    `SumoKif
  ]

lean_lib Sumo where
  roots := #[
    `Sumo
  ]
  precompileModules := false

lean_lib LeanSUMO where
  roots := #[
    `LeanSUMO
  ]
  precompileModules := false

@[default_target]
lean_exe sumo_kif_check where
  root := `Main

lean_exe sumo_kif_export_sig where
  root := `ExportSigMain

lean_exe sumo_kif_export_axioms where
  root := `ExportAxiomsMain

lean_exe sumo_kif_export_theory where
  root := `ExportTheoryMain

lean_exe sumo_kif_export_ast where
  root := `ExportAstMain

lean_exe sumo_kif_ast_check where
  root := `AstCheckMain

lean_exe sumo_kif_bmc where
  root := `BmcMain

lean_exe sumo_kif_lint where
  root := `LintMain

lean_exe sumo_kif_shallow_translate where
  root := `ShallowTranslateMain

lean_exe sumo_kif_shallow_emit where
  root := `ShallowEmitMain

lean_exe sumo_kif_hol_emit where
  root := `HolEmitMain

lean_exe test_metatyped where
  root := `Test.MetaTypedTest

lean_exe test_shallow where
  root := `Test.ShallowTest

lean_exe test_vocab where
  root := `Test.SumoVocabTest

lean_exe test_case_roles where
  root := `Test.CaseRolesTest

lean_exe test_sumo_vocab where
  root := `Test.SumoVocabTest
