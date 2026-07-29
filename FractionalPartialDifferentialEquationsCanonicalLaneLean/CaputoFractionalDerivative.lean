import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure CaputoFractionalDerivative (α : ℝ) where
  alphaPos : α > 0
  alphaLessOne : α ≤ 1
  order : ℝ := α
  definition : String := "Caputo fractional derivative of order α"
  domain : Type
  smoothness : Prop
  linearity : Prop
  compositionRule : Prop

def CaputoDerivativeClosed {α : ℝ} (D : CaputoFractionalDerivative α) : Prop :=
  D.linearity ∧ D.compositionRule

theorem caputo_derivative_closed {α : ℝ} (D : CaputoFractionalDerivative α)
    (hl : D.linearity) (hc : D.compositionRule) : CaputoDerivativeClosed D :=
  And.intro hl hc

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse
