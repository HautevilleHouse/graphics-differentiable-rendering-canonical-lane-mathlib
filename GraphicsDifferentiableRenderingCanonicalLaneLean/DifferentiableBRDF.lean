import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure DifferentiableBRDF where
  surfaceModel : Type u
  brdfFunction : Type v
  differentiabilityClass : Prop
  energyConservation : Prop
  reciprocity : Prop

structure DifferentiableBRDFEvidence (B : DifferentiableBRDF) where
  differentiabilityClassClosed : B.differentiabilityClass
  energyConservationClosed : B.energyConservation
  reciprocityClosed : B.reciprocity

def DifferentiableBRDFClosed (B : DifferentiableBRDF) : Prop :=
  B.differentiabilityClass ∧ B.energyConservation ∧ B.reciprocity

theorem differentiable_brdf_closed_from_evidence
    (B : DifferentiableBRDF) (E : DifferentiableBRDFEvidence B) :
    DifferentiableBRDFClosed B := by
  exact And.intro E.differentiabilityClassClosed
    (And.intro E.energyConservationClosed E.reciprocityClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse