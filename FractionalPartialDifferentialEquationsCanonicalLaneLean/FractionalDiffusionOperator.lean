import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalDiffusionOperatorPackage where
  alpha : ℝ
  fractionalLaplacian : Type u
  diffusionCoefficient : Prop
  regularityAssumption : Prop
  singularIntegralRepresentation : Prop

structure FractionalDiffusionOperatorEvidence (F : FractionalDiffusionOperatorPackage) where
  diffusionCoefficientClosed : F.diffusionCoefficient
  regularityAssumptionClosed : F.regularityAssumption
  singularIntegralRepresentationClosed : F.singularIntegralRepresentation

def FractionalDiffusionOperatorClosed (F : FractionalDiffusionOperatorPackage) : Prop :=
  F.diffusionCoefficient ∧ F.regularityAssumption ∧ F.singularIntegralRepresentation

theorem fractional_diffusion_operator_closed_from_evidence
    (F : FractionalDiffusionOperatorPackage)
    (E : FractionalDiffusionOperatorEvidence F) :
    FractionalDiffusionOperatorClosed F := by
  exact And.intro E.diffusionCoefficientClosed
    (And.intro E.regularityAssumptionClosed E.singularIntegralRepresentationClosed)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse
