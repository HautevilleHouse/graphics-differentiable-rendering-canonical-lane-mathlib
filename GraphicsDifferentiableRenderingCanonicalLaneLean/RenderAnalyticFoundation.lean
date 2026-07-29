import GraphicsDifferentiableRenderingCanonicalLaneLean.RenderingPrimitives
import GraphicsDifferentiableRenderingCanonicalLaneLean.DifferentiableShader
import GraphicsDifferentiableRenderingCanonicalLaneLean.LossTransport

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure RenderAnalyticFoundation where
  primitives : RenderingPrimitivePackage
  primitivesEvidence : RenderingPrimitiveEvidence primitives
  shader : DifferentiableShaderPackage
  shaderEvidence : DifferentiableShaderEvidence shader
  transport : LossTransportPackage
  transportEvidence : LossTransportEvidence transport

def RenderAnalyticFoundationClosed (A : RenderAnalyticFoundation) : Prop :=
  RenderingPrimitiveClosed A.primitives ∧
  DifferentiableShaderClosed A.shader ∧
  LossTransportClosed A.transport

theorem render_analytic_foundation_closed_from_evidence
    (A : RenderAnalyticFoundation) : RenderAnalyticFoundationClosed A :=
  And.intro (rendering_primitive_closed_from_evidence A.primitives A.primitivesEvidence)
    (And.intro (differentiable_shader_closed_from_evidence A.shader A.shaderEvidence)
      (loss_transport_closed_from_evidence A.transport A.transportEvidence))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse