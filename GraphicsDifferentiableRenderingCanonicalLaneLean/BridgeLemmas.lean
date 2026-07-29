import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GraphicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse