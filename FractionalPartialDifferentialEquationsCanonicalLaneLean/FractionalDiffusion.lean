import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.FractionalPDEExistence

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalDiffusionPackage {W : FractionalSobolevSpacePackage}
    {L : FractionalLaplacianPackage W} {E : FractionalPDEExistencePackage L} where
  diffusionCoefficient : ℝ
  decayEstimates : Prop
  asymptoticBehavior : Prop
  decayEstimatesTerm : decayEstimates
  asymptoticBehaviorTerm : asymptoticBehavior

structure FractionalDiffusionEvidence {W : FractionalSobolevSpacePackage}
    {L : FractionalLaplacianPackage W} {E : FractionalPDEExistencePackage L}
    (D : FractionalDiffusionPackage E) where
  decayEstimatesClosed : D.decayEstimates
  asymptoticBehaviorClosed : D.asymptoticBehavior

def FractionalDiffusionClosed {W : FractionalSobolevSpacePackage}
    {L : FractionalLaplacianPackage W} {E : FractionalPDEExistencePackage L}
    (D : FractionalDiffusionPackage E) : Prop :=
  D.decayEstimates ∧ D.asymptoticBehavior

theorem fractional_diffusion_closed_from_evidence {W : FractionalSobolevSpacePackage}
    {L : FractionalLaplacianPackage W} {E : FractionalPDEExistencePackage L}
    (D : FractionalDiffusionPackage E) (Ev : FractionalDiffusionEvidence D) :
    FractionalDiffusionClosed D := by
  exact And.intro Ev.decayEstimatesClosed Ev.asymptoticBehaviorClosed

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse