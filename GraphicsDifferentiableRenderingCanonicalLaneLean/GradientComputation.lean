import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure GradientComputationStructure where
  lossFunction : Type
  parameterSpace : Type
  gradientOperator : parameterSpace → parameterSpace
  chainRuleApplied : Prop
  backpropagationCorrect : Prop

structure GradientComputationEvidence (G : GradientComputationStructure) where
  lossFunctionClosed : Nonempty G.lossFunction
  parameterSpaceClosed : Nonempty G.parameterSpace
  gradientOperatorClosed : ∀ (p : G.parameterSpace), G.gradientOperator p ≠ p
  chainRuleAppliedClosed : G.chainRuleApplied
  backpropagationCorrectClosed : G.backpropagationCorrect

def GradientComputationClosed (G : GradientComputationStructure) : Prop :=
  Nonempty G.lossFunction ∧
  Nonempty G.parameterSpace ∧
  (∀ (p : G.parameterSpace), G.gradientOperator p ≠ p) ∧
  G.chainRuleApplied ∧
  G.backpropagationCorrect

theorem gradient_computation_closed_from_evidence
    (G : GradientComputationStructure) (E : GradientComputationEvidence G) :
    GradientComputationClosed G := by
  exact And.intro E.lossFunctionClosed
    (And.intro E.parameterSpaceClosed
      (And.intro E.gradientOperatorClosed
        (And.intro E.chainRuleAppliedClosed E.backpropagationCorrectClosed)))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse