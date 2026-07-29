import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure MonteCarloIntegrationPackage {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    {S : GradientFlowPackage R} (P : ReparameterizationPackage S) where
  importanceDistribution : Type u
  samplingMethod : Type v
  unbiasedEstimator : Prop
  varianceReduction : Prop
  differentiableSampling : Prop

structure MonteCarloIntegrationEvidence {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    {S : GradientFlowPackage R} {P : ReparameterizationPackage S}
    (M : MonteCarloIntegrationPackage P) where
  unbiasedEstimatorClosed : M.unbiasedEstimator
  varianceReductionClosed : M.varianceReduction
  differentiableSamplingClosed : M.differentiableSampling

def MonteCarloIntegrationClosed {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    {S : GradientFlowPackage R} {P : ReparameterizationPackage S}
    (M : MonteCarloIntegrationPackage P) : Prop :=
  M.unbiasedEstimator ∧ M.varianceReduction ∧ M.differentiableSampling

theorem monte_carlo_integration_closed_from_evidence {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    {S : GradientFlowPackage R} {P : ReparameterizationPackage S}
    (M : MonteCarloIntegrationPackage P) (E : MonteCarloIntegrationEvidence M) :
    MonteCarloIntegrationClosed M := by
  exact And.intro E.unbiasedEstimatorClosed
    (And.intro E.varianceReductionClosed E.differentiableSamplingClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse