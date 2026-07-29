import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.FractionalDiffusionOperator

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalSobolevSpacePackage {F : FractionalDiffusionOperatorPackage} where
  s : ℝ
  normDefined : Prop
  embeddingTheorems : Prop
  compactnessProperties : Prop

structure FractionalSobolevSpaceEvidence {F : FractionalDiffusionOperatorPackage}
    (S : FractionalSobolevSpacePackage F) where
  normDefinedClosed : S.normDefined
  embeddingTheoremsClosed : S.embeddingTheorems
  compactnessPropertiesClosed : S.compactnessProperties

def FractionalSobolevSpaceClosed {F : FractionalDiffusionOperatorPackage}
    (S : FractionalSobolevSpacePackage F) : Prop :=
  S.normDefined ∧ S.embeddingTheorems ∧ S.compactnessProperties

theorem fractional_sobolev_space_closed_from_evidence
    {F : FractionalDiffusionOperatorPackage}
    (S : FractionalSobolevSpacePackage F)
    (E : FractionalSobolevSpaceEvidence S) :
    FractionalSobolevSpaceClosed S := by
  exact And.intro E.normDefinedClosed
    (And.intro E.embeddingTheoremsClosed E.compactnessPropertiesClosed)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse
