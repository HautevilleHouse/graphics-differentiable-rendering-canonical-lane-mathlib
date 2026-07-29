import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure GaussianSplattingStructure where
  numGaussians : Nat
  covarianceMatrices : List (Matrix (Fin 3) (Fin 3) Float)
  opacities : List Float
  centers : List (Vector Float 3)
  differentiableRenderingPipeline : Prop

structure GaussianSplattingEvidence (G : GaussianSplattingStructure) where
  numGaussiansClosed : G.numGaussians = 1000000
  covarianceMatricesClosed : G.covarianceMatrices.length = G.numGaussians
  opacitiesClosed : G.opacities.length = G.numGaussians
  centersClosed : G.centers.length = G.numGaussians
  differentiableRenderingPipelineClosed : G.differentiableRenderingPipeline

def GaussianSplattingClosed (G : GaussianSplattingStructure) : Prop :=
  G.numGaussians = 1000000 ∧
  G.covarianceMatrices.length = G.numGaussians ∧
  G.opacities.length = G.numGaussians ∧
  G.centers.length = G.numGaussians ∧
  G.differentiableRenderingPipeline

theorem gaussian_splatting_closed_from_evidence
    (G : GaussianSplattingStructure) (E : GaussianSplattingEvidence G) :
    GaussianSplattingClosed G := by
  exact And.intro E.numGaussiansClosed
    (And.intro E.covarianceMatricesClosed
      (And.intro E.opacitiesClosed
        (And.intro E.centersClosed E.differentiableRenderingPipelineClosed)))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse