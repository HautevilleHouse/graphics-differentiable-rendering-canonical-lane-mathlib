import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure TextureMappingStructure where
  textureCoordinates : List (Vector Float 2)
  textureImages : List (Matrix (Fin 256) (Fin 256) Float)
  interpolationMethod : String
  mipmappingEnabled : Prop
  differentiableFiltering : Prop

structure TextureMappingEvidence (T : TextureMappingStructure) where
  textureCoordinatesClosed : T.textureCoordinates.length = 100000
  textureImagesClosed : T.textureImages.length = 10
  interpolationMethodClosed : T.interpolationMethod = "bilinear"
  mipmappingEnabledClosed : T.mipmappingEnabled
  differentiableFilteringClosed : T.differentiableFiltering

def TextureMappingClosed (T : TextureMappingStructure) : Prop :=
  T.textureCoordinates.length = 100000 ∧
  T.textureImages.length = 10 ∧
  T.interpolationMethod = "bilinear" ∧
  T.mipmappingEnabled ∧
  T.differentiableFiltering

theorem texture_mapping_closed_from_evidence
    (T : TextureMappingStructure) (E : TextureMappingEvidence T) :
    TextureMappingClosed T := by
  exact And.intro E.textureCoordinatesClosed
    (And.intro E.textureImagesClosed
      (And.intro E.interpolationMethodClosed
        (And.intro E.mipmappingEnabledClosed E.differentiableFilteringClosed)))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse