import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalSobolevSpacePackage where
  domain : Type u
  domainTopology : TopologicalSpace domain
  dimension : Nat
  fractionalExponent : ℝ
  regularityIndex : ℝ
  sobolevNormDefined : Prop
  embeddingTheorems : Prop
  sobolevNormDefinedTerm : sobolevNormDefined
  embeddingTheoremsTerm : embeddingTheorems

structure FractionalSobolevSpaceEvidence (W : FractionalSobolevSpacePackage) where
  sobolevNormDefinedClosed : W.sobolevNormDefined
  embeddingTheoremsClosed : W.embeddingTheorems

def FractionalSobolevSpaceClosed (W : FractionalSobolevSpacePackage) : Prop :=
  W.sobolevNormDefined ∧ W.embeddingTheorems

theorem fractional_sobolev_space_closed_from_evidence (W : FractionalSobolevSpacePackage)
    (E : FractionalSobolevSpaceEvidence W) : FractionalSobolevSpaceClosed W := by
  exact And.intro E.sobolevNormDefinedClosed E.embeddingTheoremsClosed

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse