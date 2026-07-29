import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure RegularityTheoryPackage {G : FractionalLaplacianPackage}
    {S : FractionalSobolevSpacesPackage} {V : VariationalFormulationPackage} where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  holderEstimates : Prop
  schauderEstimates : Prop

structure RegularityTheoryEvidence {G : FractionalLaplacianPackage}
    {S : FractionalSobolevSpacesPackage} {V : VariationalFormulationPackage}
    (R : RegularityTheoryPackage) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  holderEstimatesClosed : R.holderEstimates
  schauderEstimatesClosed : R.schauderEstimates

def RegularityTheoryClosed {G : FractionalLaplacianPackage}
    {S : FractionalSobolevSpacesPackage} {V : VariationalFormulationPackage}
    (R : RegularityTheoryPackage) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.holderEstimates ∧ R.schauderEstimates

theorem regularity_theory_closed_from_evidence
    {G : FractionalLaplacianPackage} {S : FractionalSobolevSpacesPackage}
    {V : VariationalFormulationPackage} (R : RegularityTheoryPackage)
    (E : RegularityTheoryEvidence R) : RegularityTheoryClosed R := by
  exact And.intro E.interiorRegularityClosed (And.intro E.boundaryRegularityClosed
    (And.intro E.holderEstimatesClosed E.schauderEstimatesClosed))

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse