import GraphicsDifferentiableRenderingCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure RenderingPipelinePackage where
  sceneGeometry : Type u
  cameraModel : Type v
  lightTransport : Type w
  pixelEvaluation : Type x
  differentiableRenderingEquation : Prop
  gradientComputation : Prop
  edgeDetection : Prop

structure RenderingPipelineEvidence (P : RenderingPipelinePackage) where
  differentiableRenderingEquationClosed : P.differentiableRenderingEquation
  gradientComputationClosed : P.gradientComputation
  edgeDetectionClosed : P.edgeDetection

def RenderingPipelineClosed (P : RenderingPipelinePackage) : Prop :=
  P.differentiableRenderingEquation ∧ P.gradientComputation ∧ P.edgeDetection

theorem rendering_pipeline_closed_from_evidence
    (P : RenderingPipelinePackage) (E : RenderingPipelineEvidence P) :
    RenderingPipelineClosed P := by
  exact And.intro E.differentiableRenderingEquationClosed
    (And.intro E.gradientComputationClosed E.edgeDetectionClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse