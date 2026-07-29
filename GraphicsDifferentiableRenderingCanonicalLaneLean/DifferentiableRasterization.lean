import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure DifferentiableRasterization where
  triangleMesh : Type u
  vertexShader : Type v
  rasterizer : Type w
  derivativeFlow : Prop
  visibilityHandling : Prop
  edgeSampling : Prop

structure DifferentiableRasterizationEvidence (D : DifferentiableRasterization) where
  derivativeFlowClosed : D.derivativeFlow
  visibilityHandlingClosed : D.visibilityHandling
  edgeSamplingClosed : D.edgeSampling

def DifferentiableRasterizationClosed (D : DifferentiableRasterization) : Prop :=
  D.derivativeFlow ∧ D.visibilityHandling ∧ D.edgeSampling

theorem differentiable_rasterization_closed_from_evidence
    (D : DifferentiableRasterization) (E : DifferentiableRasterizationEvidence D) :
    DifferentiableRasterizationClosed D := by
  exact And.intro E.derivativeFlowClosed
    (And.intro E.visibilityHandlingClosed E.edgeSamplingClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse