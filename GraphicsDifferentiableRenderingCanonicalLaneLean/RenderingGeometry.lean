import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure RenderingGeometryPackage where
  sceneManifold : Type u
  cameraModel : Type v
  lightTransportModel : Type w
  differentiableManifold : Prop
  metricSmooth : Prop
  riemannTensorLawful : Prop

structure RenderingGeometryEvidence (G : RenderingGeometryPackage) where
  differentiableManifoldClosed : G.differentiableManifold
  metricSmoothClosed : G.metricSmooth
  riemannTensorLawfulClosed : G.riemannTensorLawful

def RenderingGeometryClosed (G : RenderingGeometryPackage) : Prop :=
  G.differentiableManifold ∧ G.metricSmooth ∧ G.riemannTensorLawful

theorem rendering_geometry_closed_from_evidence (G : RenderingGeometryPackage)
    (E : RenderingGeometryEvidence G) : RenderingGeometryClosed G := by
  exact And.intro E.differentiableManifoldClosed
    (And.intro E.metricSmoothClosed E.riemannTensorLawfulClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse