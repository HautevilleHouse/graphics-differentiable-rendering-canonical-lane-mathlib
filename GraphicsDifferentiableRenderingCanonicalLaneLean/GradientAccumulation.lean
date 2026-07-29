import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure GradientAccumulation where
  vertexPositions : Type u
  lightParameters : Type v
  gradientMethod : Prop
  reverseModeAD : Prop
  convergenceGuarantee : Prop

structure GradientAccumulationEvidence (G : GradientAccumulation) where
  gradientMethodClosed : G.gradientMethod
  reverseModeADClosed : G.reverseModeAD
  convergenceGuaranteeClosed : G.convergenceGuarantee

def GradientAccumulationClosed (G : GradientAccumulation) : Prop :=
  G.gradientMethod ∧ G.reverseModeAD ∧ G.convergenceGuarantee

theorem gradient_accumulation_closed_from_evidence
    (G : GradientAccumulation) (E : GradientAccumulationEvidence G) :
    GradientAccumulationClosed G := by
  exact And.intro E.gradientMethodClosed
    (And.intro E.reverseModeADClosed E.convergenceGuaranteeClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse