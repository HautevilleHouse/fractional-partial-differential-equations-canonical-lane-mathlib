import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure MarchaudDerivativePackage where
  fractionalOrder : ℝ
  definitionDomain : Type u
  topology : TopologicalSpace definitionDomain
  marchaudFormula : Prop
  equivalenceToRiesz : Prop
  compositionRule : Prop
  marchaudFormulaTerm : marchaudFormula
  equivalenceToRieszTerm : equivalenceToRiesz
  compositionRuleTerm : compositionRule

structure MarchaudDerivativeEvidence (M : MarchaudDerivativePackage) where
  marchaudFormulaClosed : M.marchaudFormula
  equivalenceToRieszClosed : M.equivalenceToRiesz
  compositionRuleClosed : M.compositionRule

def MarchaudDerivativeClosed (M : MarchaudDerivativePackage) : Prop :=
  M.marchaudFormula ∧ M.equivalenceToRiesz ∧ M.compositionRule

theorem marchaud_derivative_closed_from_evidence (M : MarchaudDerivativePackage)
    (E : MarchaudDerivativeEvidence M) : MarchaudDerivativeClosed M := by
  exact And.intro E.marchaudFormulaClosed
    (And.intro E.equivalenceToRieszClosed E.compositionRuleClosed)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse