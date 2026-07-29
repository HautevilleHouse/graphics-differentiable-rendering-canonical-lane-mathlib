import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure ReparameterizationPackage {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    (S : GradientFlowPackage R) where
  reparamFunction : Type u
  changeOfVariables : Type v
  invarianceUnderReparam : Prop
  jacobianCorrection : Prop
  smoothTransition : Prop

structure ReparameterizationEvidence {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    {S : GradientFlowPackage R} (P : ReparameterizationPackage S) where
  invarianceUnderReparamClosed : P.invarianceUnderReparam
  jacobianCorrectionClosed : P.jacobianCorrection
  smoothTransitionClosed : P.smoothTransition

def ReparameterizationClosed {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    {S : GradientFlowPackage R} (P : ReparameterizationPackage S) : Prop :=
  P.invarianceUnderReparam ∧ P.jacobianCorrection ∧ P.smoothTransition

theorem reparameterization_closed_from_evidence {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    {S : GradientFlowPackage R} (P : ReparameterizationPackage S)
    (E : ReparameterizationEvidence P) : ReparameterizationClosed P := by
  exact And.intro E.invarianceUnderReparamClosed
    (And.intro E.jacobianCorrectionClosed E.smoothTransitionClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse