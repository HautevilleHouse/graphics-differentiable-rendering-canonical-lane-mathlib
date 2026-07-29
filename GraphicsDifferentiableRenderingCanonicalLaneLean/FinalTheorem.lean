import HautevilleHouse.GraphicsDifferentiableRenderingCanonicalLaneLean.DifferentiableRenderingBridge

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

def ConstrainedGraphicsDifferentiableRenderingClosure (A : DifferentiableRenderingAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_graphics_differentiable_rendering_endgame (A : DifferentiableRenderingAdmittedObject) :
    ConstrainedGraphicsDifferentiableRenderingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse
