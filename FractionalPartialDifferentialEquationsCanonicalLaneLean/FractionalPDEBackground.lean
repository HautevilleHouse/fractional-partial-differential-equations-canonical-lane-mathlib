import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalPDEBackground where
  domainDimension : Nat
  fractionalOrder : ℝ
  functionSpace : Type
  operatorFamily : Type
  stabilityCondition : Prop
  existenceCondition : Prop
  uniquenessCondition : Prop

structure FractionalPDEBackgroundEvidence (B : FractionalPDEBackground) where
  stabilityConditionClosed : B.stabilityCondition
  existenceConditionClosed : B.existenceCondition
  uniquenessConditionClosed : B.uniquenessCondition

def FractionalPDEBackgroundClosed (B : FractionalPDEBackground) : Prop :=
  B.stabilityCondition ∧ B.existenceCondition ∧ B.uniquenessCondition

theorem fractional_pde_background_closed_from_evidence (B : FractionalPDEBackground) (E : FractionalPDEBackgroundEvidence B) : FractionalPDEBackgroundClosed B := by
  exact And.intro E.stabilityConditionClosed (And.intro E.existenceConditionClosed E.uniquenessConditionClosed)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse