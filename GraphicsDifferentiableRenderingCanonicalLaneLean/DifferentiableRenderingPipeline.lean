import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure DifferentiableRenderingPipeline where
  sceneGeometry : Type u
  lightTransport : Type v
  imageFormation : Type w
  sceneDefined : Prop
  lightTransportClosed : Prop
  imageFormationClosed : Prop

structure DifferentiableRenderingPipelineEvidence (D : DifferentiableRenderingPipeline) where
  sceneDefinedClosed : D.sceneDefined
  lightTransportClosedClosed : D.lightTransportClosed
  imageFormationClosed : D.imageFormationClosed

def DifferentiableRenderingPipelineClosed (D : DifferentiableRenderingPipeline) : Prop :=
  D.sceneDefined ∧ D.lightTransportClosed ∧ D.imageFormationClosed

theorem differentiable_rendering_pipeline_closed_from_evidence
    (D : DifferentiableRenderingPipeline) (E : DifferentiableRenderingPipelineEvidence D) :
    DifferentiableRenderingPipelineClosed D := by
  exact And.intro E.sceneDefinedClosed
    (And.intro E.lightTransportClosedClosed E.imageFormationClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse