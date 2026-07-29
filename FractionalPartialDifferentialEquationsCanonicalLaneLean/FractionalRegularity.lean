import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.FractionalSobolevSpaces

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalRegularity (s t : ℝ) (p q : ℝ) where
  sourceSpace : FractionalSobolevSpace s p
  targetSpace : FractionalSobolevSpace t q
  smoothingEstimates : Prop
  parabolicRegularity : Prop
  schauderEstimates : Prop
  maximalRegularity : Prop

structure FractionalRegularityEvidence {s t p q : ℝ} (R : FractionalRegularity s t p q) where
  sourceSpaceClosed : FractionalSobolevClosed R.sourceSpace
  targetSpaceClosed : FractionalSobolevClosed R.targetSpace
  smoothingEstimatesClosed : R.smoothingEstimates
  parabolicRegularityClosed : R.parabolicRegularity
  schauderEstimatesClosed : R.schauderEstimates
  maximalRegularityClosed : R.maximalRegularity

def FractionalRegularityClosed {s t p q : ℝ} (R : FractionalRegularity s t p q) : Prop :=
  FractionalSobolevClosed R.sourceSpace ∧ FractionalSobolevClosed R.targetSpace ∧
  R.smoothingEstimates ∧ R.parabolicRegularity ∧ R.schauderEstimates ∧ R.maximalRegularity

theorem fractional_regularity_closed_from_evidence
    {s t p q : ℝ} (R : FractionalRegularity s t p q) (E : FractionalRegularityEvidence R) :
    FractionalRegularityClosed R := by
  exact And.intro E.sourceSpaceClosed
    (And.intro E.targetSpaceClosed
      (And.intro E.smoothingEstimatesClosed
        (And.intro E.parabolicRegularityClosed
          (And.intro E.schauderEstimatesClosed
            E.maximalRegularityClosed))))

end HautevilleHouse
end HautevilleHouse