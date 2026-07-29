import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.FractionalSobolevSpaces

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalLaplacianPackage {W : FractionalSobolevSpacePackage} where
  fractionalLaplacianOperator : Type u
  symbolDefined : Prop
  integralRepresentation : Prop
  mappingProperties : Prop
  symbolDefinedTerm : symbolDefined
  integralRepresentationTerm : integralRepresentation
  mappingPropertiesTerm : mappingProperties

structure FractionalLaplacianEvidence {W : FractionalSobolevSpacePackage}
    (L : FractionalLaplacianPackage W) where
  symbolDefinedClosed : L.symbolDefined
  integralRepresentationClosed : L.integralRepresentation
  mappingPropertiesClosed : L.mappingProperties

def FractionalLaplacianClosed {W : FractionalSobolevSpacePackage}
    (L : FractionalLaplacianPackage W) : Prop :=
  L.symbolDefined ∧ L.integralRepresentation ∧ L.mappingProperties

theorem fractional_laplacian_closed_from_evidence {W : FractionalSobolevSpacePackage}
    (L : FractionalLaplacianPackage W) (E : FractionalLaplacianEvidence L) :
    FractionalLaplacianClosed L := by
  exact And.intro E.symbolDefinedClosed
    (And.intro E.integralRepresentationClosed E.mappingPropertiesClosed)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse