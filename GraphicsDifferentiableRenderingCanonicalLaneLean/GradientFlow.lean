import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure GradientFlowPackage {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} (R : DifferentiableRenderingCorePackage G F) where
  lossFunctional : Type u
  gradientField : Type v
  gradientFlowEquation : Prop
  convergenceCriteria : Prop
  smoothDependence : Prop

structure GradientFlowEvidence {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    (S : GradientFlowPackage R) where
  lossFunctionalClosed : S.lossFunctional
  gradientFieldClosed : S.gradientField
  gradientFlowEquationClosed : S.gradientFlowEquation
  convergenceCriteriaClosed : S.convergenceCriteria
  smoothDependenceClosed : S.smoothDependence

def GradientFlowClosed {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    (S : GradientFlowPackage R) : Prop :=
  S.lossFunctional ∧ S.gradientField ∧ S.gradientFlowEquation ∧
  S.convergenceCriteria ∧ S.smoothDependence

theorem gradient_flow_closed_from_evidence {G : RenderingGeometryPackage}
    {F : RenderingEquationPackage G} {R : DifferentiableRenderingCorePackage G F}
    (S : GradientFlowPackage R) (E : GradientFlowEvidence S) :
    GradientFlowClosed S := by
  exact And.intro E.lossFunctionalClosed
    (And.intro E.gradientFieldClosed
      (And.intro E.gradientFlowEquationClosed
        (And.intro E.convergenceCriteriaClosed
          E.smoothDependenceClosed)))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse