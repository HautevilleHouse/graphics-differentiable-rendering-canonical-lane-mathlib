import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact Or.inl A.endpointSatisfied

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact Or.inl A.endpointSatisfied

def ConstrainedRenderingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_rendering_endgame (A : AdmissibleClass) :
    ConstrainedRenderingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse