import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure RenderingEquationPackage (G : RenderingGeometryPackage) where
  radianceField : Type w
  transportOperator : Type x
  scatteringKernel : Type y
  integroDifferentialEquation : Prop
  boundaryConditions : Prop
  differentiableFormulation : Prop

structure RenderingEquationEvidence {G : RenderingGeometryPackage}
    (F : RenderingEquationPackage G) where
  integroDifferentialEquationClosed : F.integroDifferentialEquation
  boundaryConditionsClosed : F.boundaryConditions
  differentiableFormulationClosed : F.differentiableFormulation

def RenderingEquationClosed {G : RenderingGeometryPackage}
    (F : RenderingEquationPackage G) : Prop :=
  F.integroDifferentialEquation ∧ F.boundaryConditions ∧
  F.differentiableFormulation

theorem rendering_equation_closed_from_evidence {G : RenderingGeometryPackage}
    (F : RenderingEquationPackage G) (E : RenderingEquationEvidence F) :
    RenderingEquationClosed F := by
  exact And.intro E.integroDifferentialEquationClosed
    (And.intro E.boundaryConditionsClosed
      E.differentiableFormulationClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse