import Lake
open Lake DSL

package «sumoLean4» where
  -- keep this lightweight; no mathlib dependency

lean_lib SumoKif where
  roots := #[
    `SumoKif
  ]

@[default_target]
lean_exe sumo_kif_check where
  root := `Main
