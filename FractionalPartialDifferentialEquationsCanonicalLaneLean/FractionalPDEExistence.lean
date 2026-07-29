import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.FractionalSobolevSpace

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalPDEExistencePackage {F : FractionalDiffusionOperatorPackage}
    {S : FractionalSobolevSpacePackage F} where
  initialCondition : Prop
  existenceInterval : Prop
  mildSolution : Prop
  uniqueness : Prop

structure FractionalPDEExistenceEvidence {F : FractionalDiffusionOperatorPackage}
    {S : FractionalSobolevSpacePackage F}
    (E : FractionalPDEExistencePackage S) where
  initialConditionClosed : E.initialCondition
  existenceIntervalClosed : E.existenceInterval
  mildSolutionClosed : E.mildSolution
  uniquenessClosed : E.uniqueness

def FractionalPDEExistenceClosed {F : FractionalDiffusionOperatorPackage}
    {S : FractionalSobolevSpacePackage F}
    (E : FractionalPDEExistencePackage S) : Prop :=
  E.initialCondition ∧ E.existenceInterval ∧ E.mildSolution ∧ E.uniqueness

theorem fractional_pde_existence_closed_from_evidence
    {F : FractionalDiffusionOperatorPackage}
    {S : FractionalSobolevSpacePackage F}
    (E : FractionalPDEExistencePackage S)
    (Ev : FractionalPDEExistenceEvidence E) :
    FractionalPDEExistenceClosed E := by
  exact And.intro Ev.initialConditionClosed
    (And.intro Ev.existenceIntervalClosed
      (And.intro Ev.mildSolutionClosed Ev.uniquenessClosed))

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse
