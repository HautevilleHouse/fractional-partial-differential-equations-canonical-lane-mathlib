import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.FractionalLaplacian

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalDiffusionEquation (s : ℝ) where
  laplacian : FractionalLaplacian s
  initialCondition : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop
  regularizingEffect : Prop

def FractionalDiffusionClosed {s : ℝ} (E : FractionalDiffusionEquation s) : Prop :=
  E.initialCondition ∧ E.solutionExistence ∧ E.solutionUniqueness ∧ E.regularizingEffect

theorem fractional_diffusion_closed {s : ℝ} (E : FractionalDiffusionEquation s)
    (hi : E.initialCondition) (he : E.solutionExistence)
    (hu : E.solutionUniqueness) (hr : E.regularizingEffect) :
    FractionalDiffusionClosed E := by
  exact And.intro hi (And.intro he (And.intro hu hr))

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse
