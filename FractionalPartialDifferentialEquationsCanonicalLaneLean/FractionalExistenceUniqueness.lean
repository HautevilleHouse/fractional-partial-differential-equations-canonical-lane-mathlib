import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FractionalPartialDifferentialEquationsCanonicalLaneLean.FractionalDiffusionModel

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalExistenceUniqueness (α β γ δ : ℝ) where
  model : FractionalDiffusionModel α β γ δ
  localExistence : Prop
  globalExistence : Prop
  uniqueness : Prop
  continuousDependence : Prop
  blowUpCriteria : Prop

structure FractionalExistenceUniquenessEvidence {α β γ δ : ℝ} (U : FractionalExistenceUniqueness α β γ δ) where
  modelClosed : FractionalDiffusionModelClosed U.model
  localExistenceClosed : U.localExistence
  globalExistenceClosed : U.globalExistence
  uniquenessClosed : U.uniqueness
  continuousDependenceClosed : U.continuousDependence
  blowUpCriteriaClosed : U.blowUpCriteria

def FractionalExistenceUniquenessClosed {α β γ δ : ℝ} (U : FractionalExistenceUniqueness α β γ δ) : Prop :=
  FractionalDiffusionModelClosed U.model ∧ U.localExistence ∧ U.globalExistence ∧
  U.uniqueness ∧ U.continuousDependence ∧ U.blowUpCriteria

theorem fractional_existence_uniqueness_closed_from_evidence
    {α β γ δ : ℝ} (U : FractionalExistenceUniqueness α β γ δ) (E : FractionalExistenceUniquenessEvidence U) :
    FractionalExistenceUniquenessClosed U := by
  exact And.intro E.modelClosed
    (And.intro E.localExistenceClosed
      (And.intro E.globalExistenceClosed
        (And.intro E.uniquenessClosed
          (And.intro E.continuousDependenceClosed
            E.blowUpCriteriaClosed))))

end HautevilleHouse
end HautevilleHouse