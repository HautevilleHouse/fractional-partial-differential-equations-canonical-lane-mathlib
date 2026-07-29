import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.SpaceFractionalPDE
import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.TimeFractionalPDE

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalDiffusionModel (α β γ δ : ℝ) where
  spacePDE : SpaceFractionalPDE α β
  timePDE : TimeFractionalPDE γ δ
  coupling : Prop
  scalingRelations : Prop
  anomalousDiffusion : Prop
  asymptoticProfiles : Prop

structure FractionalDiffusionModelEvidence {α β γ δ : ℝ} (M : FractionalDiffusionModel α β γ δ) where
  spacePDEClosed : SpaceFractionalPDEClosed M.spacePDE
  timePDEClosed : TimeFractionalPDEClosed M.timePDE
  couplingClosed : M.coupling
  scalingRelationsClosed : M.scalingRelations
  anomalousDiffusionClosed : M.anomalousDiffusion
  asymptoticProfilesClosed : M.asymptoticProfiles

def FractionalDiffusionModelClosed {α β γ δ : ℝ} (M : FractionalDiffusionModel α β γ δ) : Prop :=
  SpaceFractionalPDEClosed M.spacePDE ∧ TimeFractionalPDEClosed M.timePDE ∧
  M.coupling ∧ M.scalingRelations ∧ M.anomalousDiffusion ∧ M.asymptoticProfiles

theorem fractional_diffusion_model_closed_from_evidence
    {α β γ δ : ℝ} (M : FractionalDiffusionModel α β γ δ) (E : FractionalDiffusionModelEvidence M) :
    FractionalDiffusionModelClosed M := by
  exact And.intro E.spacePDEClosed
    (And.intro E.timePDEClosed
      (And.intro E.couplingClosed
        (And.intro E.scalingRelationsClosed
          (And.intro E.anomalousDiffusionClosed
            E.asymptoticProfilesClosed))))

end HautevilleHouse
end HautevilleHouse