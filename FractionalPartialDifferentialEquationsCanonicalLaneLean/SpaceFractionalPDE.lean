import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure SpaceFractionalPDE (α : ℝ) (β : ℝ) where
  fractionalLaplacian : Type u
  kernelDefinition : Prop
  symbolDefinition : Prop
  maximumPrinciple : Prop
  regularityTheory : Prop
  wellPosedness : Prop

structure SpaceFractionalPDEEvidence {α β : ℝ} (P : SpaceFractionalPDE α β) where
  kernelDefinitionClosed : P.kernelDefinition
  symbolDefinitionClosed : P.symbolDefinition
  maximumPrincipleClosed : P.maximumPrinciple
  regularityTheoryClosed : P.regularityTheory
  wellPosednessClosed : P.wellPosedness

def SpaceFractionalPDEClosed {α β : ℝ} (P : SpaceFractionalPDE α β) : Prop :=
  P.kernelDefinition ∧ P.symbolDefinition ∧ P.maximumPrinciple ∧
  P.regularityTheory ∧ P.wellPosedness

theorem space_fractional_pde_closed_from_evidence
    {α β : ℝ} (P : SpaceFractionalPDE α β) (E : SpaceFractionalPDEEvidence P) :
    SpaceFractionalPDEClosed P := by
  exact And.intro E.kernelDefinitionClosed
    (And.intro E.symbolDefinitionClosed
      (And.intro E.maximumPrincipleClosed
        (And.intro E.regularityTheoryClosed
          E.wellPosednessClosed)))

end HautevilleHouse
end HautevilleHouse