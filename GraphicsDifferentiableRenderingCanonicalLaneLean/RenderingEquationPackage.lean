import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure RenderingEquationPackage where
  sceneRadianceField : Type u
  transportOperator : Type v
  surfaceScattering : Type w
  emissionTerm : Prop
  energyConservation : Prop
  recurrenceRelation : Prop
  uniquenessOfSolution : Prop
  differentiableParameterization : Prop

structure RenderingEquationEvidence (P : RenderingEquationPackage) where
  emissionTermClosed : P.emissionTerm
  energyConservationClosed : P.energyConservation
  recurrenceRelationClosed : P.recurrenceRelation
  uniquenessOfSolutionClosed : P.uniquenessOfSolution
  differentiableParameterizationClosed : P.differentiableParameterization

def RenderingEquationClosed (P : RenderingEquationPackage) : Prop :=
  P.emissionTerm ∧ P.energyConservation ∧ P.recurrenceRelation ∧
  P.uniquenessOfSolution ∧ P.differentiableParameterization

theorem rendering_equation_closed_from_evidence
    (P : RenderingEquationPackage) (E : RenderingEquationEvidence P) :
    RenderingEquationClosed P := by
  exact And.intro E.emissionTermClosed
    (And.intro E.energyConservationClosed
      (And.intro E.recurrenceRelationClosed
        (And.intro E.uniquenessOfSolutionClosed
          E.differentiableParameterizationClosed)))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse
