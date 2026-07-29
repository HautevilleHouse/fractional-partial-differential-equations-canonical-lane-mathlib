import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

structure FractionalPDEAdmittedObject where
  domain : Type u
  topology : TopologicalSpace domain
  fractionalOrder : ℝ
  sourceTerm : domain → ℝ
  solution : domain → ℝ
  solutionRegularity : Prop
  fractionalPDEsat : Prop
  conclusion : fractionalPDEsat

structure AdmissibleClass where
  object : FractionalPDEAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FractionalPDEWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse