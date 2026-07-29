import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalEvolutionEquation where
  timeDomain : Type
  spatialDomain : Type
  fractionalOrder : ℝ
  wellPosednessCondition : Prop
  regularityPropagation : Prop
  asymptoticBehavior : Prop

structure FractionalEvolutionEquationEvidence (E : FractionalEvolutionEquation) where
  wellPosednessConditionClosed : E.wellPosednessCondition
  regularityPropagationClosed : E.regularityPropagation
  asymptoticBehaviorClosed : E.asymptoticBehavior

def FractionalEvolutionEquationClosed (E : FractionalEvolutionEquation) : Prop :=
  E.wellPosednessCondition ∧ E.regularityPropagation ∧ E.asymptoticBehavior

theorem fractional_evolution_equation_closed_from_evidence (E : FractionalEvolutionEquation) (Ev : FractionalEvolutionEquationEvidence E) : FractionalEvolutionEquationClosed E := by
  exact And.intro Ev.wellPosednessConditionClosed (And.intro Ev.regularityPropagationClosed Ev.asymptoticBehaviorClosed)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse