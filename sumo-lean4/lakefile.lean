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

@[default_target]
lean_exe sumo_kif_check where
  root := `Main

lean_exe sumo_kif_export_sig where
  root := `ExportSigMain

lean_exe sumo_kif_export_axioms where
  root := `ExportAxiomsMain

lean_exe sumo_kif_export_theory where
  root := `ExportTheoryMain
