import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure RasterizationPipelineStructure where
  vertexShader : Type
  fragmentShader : Type
  viewportTransform : Matrix (Fin 4) (Fin 4) Float
  depthTestEnabled : Prop
  differentiableRasterization : Prop

structure RasterizationPipelineEvidence (R : RasterizationPipelineStructure) where
  vertexShaderClosed : Nonempty R.vertexShader
  fragmentShaderClosed : Nonempty R.fragmentShader
  viewportTransformClosed : R.viewportTransform ≠ 0
  depthTestEnabledClosed : R.depthTestEnabled
  differentiableRasterizationClosed : R.differentiableRasterization

def RasterizationPipelineClosed (R : RasterizationPipelineStructure) : Prop :=
  Nonempty R.vertexShader ∧
  Nonempty R.fragmentShader ∧
  R.viewportTransform ≠ 0 ∧
  R.depthTestEnabled ∧
  R.differentiableRasterization

theorem rasterization_pipeline_closed_from_evidence
    (R : RasterizationPipelineStructure) (E : RasterizationPipelineEvidence R) :
    RasterizationPipelineClosed R := by
  exact And.intro E.vertexShaderClosed
    (And.intro E.fragmentShaderClosed
      (And.intro E.viewportTransformClosed
        (And.intro E.depthTestEnabledClosed E.differentiableRasterizationClosed)))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse