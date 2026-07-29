import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsDifferentiableRenderingCanonicalLaneLean.RenderingEquationPackage

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure DifferentialPathIntegralPackage {P : RenderingEquationPackage}
    (R : RenderingEquationPackage) where
  pathSpace : Type u
  measureOnPaths : Type v
  throughputWeight : Type w
  integralDefinition : Prop
  integrationByParts : Prop
  derivativeUnderIntegral : Prop
  lipschitzContinuity : Prop

structure DifferentialPathIntegralEvidence {P : RenderingEquationPackage}
    {R : RenderingEquationPackage} (D : DifferentialPathIntegralPackage R) where
  integralDefinitionClosed : D.integralDefinition
  integrationByPartsClosed : D.integrationByParts
  derivativeUnderIntegralClosed : D.derivativeUnderIntegral
  lipschitzContinuityClosed : D.lipschitzContinuity

def DifferentialPathIntegralClosed {P : RenderingEquationPackage}
    {R : RenderingEquationPackage} (D : DifferentialPathIntegralPackage R) : Prop :=
  D.integralDefinition ∧ D.integrationByParts ∧
  D.derivativeUnderIntegral ∧ D.lipschitzContinuity

theorem differential_path_integral_closed_from_evidence
    {P : RenderingEquationPackage} {R : RenderingEquationPackage}
    (D : DifferentialPathIntegralPackage R) (E : DifferentialPathIntegralEvidence D) :
    DifferentialPathIntegralClosed D := by
  exact And.intro E.integralDefinitionClosed
    (And.intro E.integrationByPartsClosed
      (And.intro E.derivativeUnderIntegralClosed
        E.lipschitzContinuityClosed))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse
