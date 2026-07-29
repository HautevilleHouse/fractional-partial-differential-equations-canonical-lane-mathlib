import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure VariationalFormulationPackage {G : FractionalLaplacianPackage}
    {S : FractionalSobolevSpacesPackage} where
  bilinearForm : Type u
  coercivity : Prop
  boundedness : Prop
  laxMilgramApplicable : Prop
  weakSolutionExistence : Prop

structure VariationalFormulationEvidence {G : FractionalLaplacianPackage}
    {S : FractionalSobolevSpacesPackage} (V : VariationalFormulationPackage) where
  coercivityClosed : V.coercivity
  boundednessClosed : V.boundedness
  laxMilgramApplicableClosed : V.laxMilgramApplicable
  weakSolutionExistenceClosed : V.weakSolutionExistence

def VariationalFormulationClosed {G : FractionalLaplacianPackage}
    {S : FractionalSobolevSpacesPackage} (V : VariationalFormulationPackage) : Prop :=
  V.coercivity ∧ V.boundedness ∧ V.laxMilgramApplicable ∧ V.weakSolutionExistence

theorem variational_formulation_closed_from_evidence
    {G : FractionalLaplacianPackage} {S : FractionalSobolevSpacesPackage}
    (V : VariationalFormulationPackage) (E : VariationalFormulationEvidence V) :
    VariationalFormulationClosed V := by
  exact And.intro E.coercivityClosed (And.intro E.boundednessClosed
    (And.intro E.laxMilgramApplicableClosed E.weakSolutionExistenceClosed))

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse