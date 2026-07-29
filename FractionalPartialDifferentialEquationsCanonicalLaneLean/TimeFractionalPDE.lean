import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure TimeFractionalPDE (γ : ℝ) (δ : ℝ) where
  fractionalTimeDerivative : Type u
  caputoDefinition : Prop
  riemannLiouvilleDefinition : Prop
  subordinationPrinciple : Prop
  fundamentalSolution : Prop
  wellPosedness : Prop

structure TimeFractionalPDEEvidence {γ δ : ℝ} (Q : TimeFractionalPDE γ δ) where
  caputoDefinitionClosed : Q.caputoDefinition
  riemannLiouvilleDefinitionClosed : Q.riemannLiouvilleDefinition
  subordinationPrincipleClosed : Q.subordinationPrinciple
  fundamentalSolutionClosed : Q.fundamentalSolution
  wellPosednessClosed : Q.wellPosedness

def TimeFractionalPDEClosed {γ δ : ℝ} (Q : TimeFractionalPDE γ δ) : Prop :=
  Q.caputoDefinition ∧ Q.riemannLiouvilleDefinition ∧ Q.subordinationPrinciple ∧
  Q.fundamentalSolution ∧ Q.wellPosedness

theorem time_fractional_pde_closed_from_evidence
    {γ δ : ℝ} (Q : TimeFractionalPDE γ δ) (E : TimeFractionalPDEEvidence Q) :
    TimeFractionalPDEClosed Q := by
  exact And.intro E.caputoDefinitionClosed
    (And.intro E.riemannLiouvilleDefinitionClosed
      (And.intro E.subordinationPrincipleClosed
        (And.intro E.fundamentalSolutionClosed
          E.wellPosednessClosed)))

end HautevilleHouse
end HautevilleHouse