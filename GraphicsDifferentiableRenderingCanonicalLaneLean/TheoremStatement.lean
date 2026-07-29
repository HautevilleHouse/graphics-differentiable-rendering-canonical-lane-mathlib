import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure RenderingAdmittedObject where
  sceneManifold : Type
  differentiableStructure : Prop
  renderingEquation : Prop
  conclusion : renderingEquation

def RenderingWitnessClosed (O : RenderingAdmittedObject) : Prop :=
  O.renderingEquation

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse
