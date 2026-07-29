import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure NonlocalWellPosednessPackage {G : FractionalLaplacianPackage} where
  initialCondition : Type u
  existenceInterval : ℝ → Prop
  uniqueness : Prop
  continuousDependence : Prop
  mildSolution : Prop

structure NonlocalWellPosednessEvidence {G : FractionalLaplacianPackage}
    (W : NonlocalWellPosednessPackage) where
  existenceIntervalClosed : W.existenceInterval
  uniquenessClosed : W.uniqueness
  continuousDependenceClosed : W.continuousDependence
  mildSolutionClosed : W.mildSolution

def NonlocalWellPosednessClosed {G : FractionalLaplacianPackage}
    (W : NonlocalWellPosednessPackage) : Prop :=
  W.existenceInterval ∧ W.uniqueness ∧ W.continuousDependence ∧ W.mildSolution

theorem nonlocal_well_posedness_closed_from_evidence
    {G : FractionalLaplacianPackage} (W : NonlocalWellPosednessPackage)
    (E : NonlocalWellPosednessEvidence W) : NonlocalWellPosednessClosed W := by
  exact And.intro E.existenceIntervalClosed (And.intro E.uniquenessClosed
    (And.intro E.continuousDependenceClosed E.mildSolutionClosed))

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse