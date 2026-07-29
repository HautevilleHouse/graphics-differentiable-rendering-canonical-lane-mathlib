import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure DifferentiableShaderPackage where
  shadingFunction : Type u
  parameterSpace : Type v
  derivativeComputation : Prop
  gradientClipping : Prop
  stochasticRegularization : Prop

structure DifferentiableShaderEvidence (S : DifferentiableShaderPackage) where
  derivativeComputationClosed : S.derivativeComputation
  gradientClippingClosed : S.gradientClipping
  stochasticRegularizationClosed : S.stochasticRegularization

def DifferentiableShaderClosed (S : DifferentiableShaderPackage) : Prop :=
  S.derivativeComputation ∧ S.gradientClipping ∧ S.stochasticRegularization

theorem differentiable_shader_closed_from_evidence (S : DifferentiableShaderPackage)
    (E : DifferentiableShaderEvidence S) : DifferentiableShaderClosed S :=
  And.intro E.derivativeComputationClosed
    (And.intro E.gradientClippingClosed E.stochasticRegularizationClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse