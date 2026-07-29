import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace FractionalPartialDifferentialEquationsCanonicalLaneLean

def FractionalPDEWitnessClosed (O : FractionalPDEAdmittedObject) : Prop :=
  O.fractionalPDEsat

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FractionalPDEWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FractionalPartialDifferentialEquationsCanonicalLaneLean
end HautevilleHouse