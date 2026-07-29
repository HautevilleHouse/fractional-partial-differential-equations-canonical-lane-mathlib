import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.FractionalDiffusionEquation

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalReactionDiffusion (s : ℝ) (f : Type) where
  diffusion : FractionalDiffusionEquation s
  reactionTerm : f
  boundedness : Prop
  wellposedness : Prop
  patternFormation : Prop

def FractionalReactionDiffusionClosed {s : ℝ} {f : Type}
    (R : FractionalReactionDiffusion s f) : Prop :=
  R.boundedness ∧ R.wellposedness ∧ R.patternFormation

theorem fractional_reaction_diffusion_closed {s : ℝ} {f : Type}
    (R : FractionalReactionDiffusion s f)
    (hb : R.boundedness) (hw : R.wellposedness) (hp : R.patternFormation) :
    FractionalReactionDiffusionClosed R := by
  exact And.intro hb (And.intro hw hp)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse
