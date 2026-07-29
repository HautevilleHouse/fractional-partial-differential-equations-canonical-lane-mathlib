import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalEllipticOperator where
  fractionalOrder : ℝ
  ellipticityConstant : ℝ
  coercivityCondition : Prop
  fredholmProperty : Prop
  indexFormula : Prop

structure FractionalEllipticOperatorEvidence (E : FractionalEllipticOperator) where
  coercivityConditionClosed : E.coercivityCondition
  fredholmPropertyClosed : E.fredholmProperty
  indexFormulaClosed : E.indexFormula

def FractionalEllipticOperatorClosed (E : FractionalEllipticOperator) : Prop :=
  E.coercivityCondition ∧ E.fredholmProperty ∧ E.indexFormula

theorem fractional_elliptic_operator_closed_from_evidence (E : FractionalEllipticOperator) (Ev : FractionalEllipticOperatorEvidence E) : FractionalEllipticOperatorClosed E := by
  exact And.intro Ev.coercivityConditionClosed (And.intro Ev.fredholmPropertyClosed Ev.indexFormulaClosed)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse