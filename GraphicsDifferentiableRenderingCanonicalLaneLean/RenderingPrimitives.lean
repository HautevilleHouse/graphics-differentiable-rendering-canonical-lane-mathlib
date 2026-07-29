import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure RenderingPrimitivePackage where
  sceneGeometry : Type u
  cameraModel : Type v
  lightTransport : Type w
  surfaceRepresentation : Prop
  visibilityDetermination : Prop
  shadingModel : Prop

structure RenderingPrimitiveEvidence (R : RenderingPrimitivePackage) where
  surfaceRepresentationClosed : R.surfaceRepresentation
  visibilityDeterminationClosed : R.visibilityDetermination
  shadingModelClosed : R.shadingModel

def RenderingPrimitiveClosed (R : RenderingPrimitivePackage) : Prop :=
  R.surfaceRepresentation ∧ R.visibilityDetermination ∧ R.shadingModel

theorem rendering_primitive_closed_from_evidence (R : RenderingPrimitivePackage)
    (E : RenderingPrimitiveEvidence R) : RenderingPrimitiveClosed R :=
  And.intro E.surfaceRepresentationClosed
    (And.intro E.visibilityDeterminationClosed E.shadingModelClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse