import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure LossTransportPackage where
  lossFunction : Type u
  adjointRendering : Type v
  gradientBackpropagation : Prop
  materialOptimization : Prop
  geometryOptimization : Prop

structure LossTransportEvidence (L : LossTransportPackage) where
  gradientBackpropagationClosed : L.gradientBackpropagation
  materialOptimizationClosed : L.materialOptimization
  geometryOptimizationClosed : L.geometryOptimization

def LossTransportClosed (L : LossTransportPackage) : Prop :=
  L.gradientBackpropagation ∧ L.materialOptimization ∧ L.geometryOptimization

theorem loss_transport_closed_from_evidence (L : LossTransportPackage)
    (E : LossTransportEvidence L) : LossTransportClosed L :=
  And.intro E.gradientBackpropagationClosed
    (And.intro E.materialOptimizationClosed E.geometryOptimizationClosed)

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse