import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsDifferentiableRenderingCanonicalLaneLean.RenderingEquationPackage
import HautevilleHouse.GraphicsDifferentiableRenderingCanonicalLaneLean.DifferentialPathIntegral

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure DifferentiableRenderingAdmittedObject where
  pathIntegralClosed : Prop
  renderingEquationClosed : Prop
  differentiableTransport : Prop
  conclusion : differentiableTransport

structure GameState where
  object : DifferentiableRenderingAdmittedObject

def bridgeClosed (A : DifferentiableRenderingAdmittedObject) : Prop :=
  A.differentiableTransport

theorem bridge_from_admissible_class (A : DifferentiableRenderingAdmittedObject) :
    bridgeClosed A := by
  exact A.conclusion

def gateClosed (A : DifferentiableRenderingAdmittedObject) : Prop :=
  A.pathIntegralClosed ∨ A.renderingEquationClosed

theorem gate_from_admissible_class (A : DifferentiableRenderingAdmittedObject) :
    gateClosed A := by
  exact Or.inl A.pathIntegralClosed

def ConstrainedGraphicsDifferentiableRenderingClosure (A : DifferentiableRenderingAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_graphics_differentiable_rendering_endgame (A : DifferentiableRenderingAdmittedObject) :
    ConstrainedGraphicsDifferentiableRenderingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse
