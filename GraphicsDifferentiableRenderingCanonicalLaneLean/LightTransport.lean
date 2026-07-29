import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

structure LightTransportStructure where
  lightSources : List (Vector Float 3)
  materialProperties : List Float
  radianceEquation : Prop
  monteCarloIntegration : Prop
  differentiableLightTransport : Prop

structure LightTransportEvidence (L : LightTransportStructure) where
  lightSourcesClosed : L.lightSources.length = 100
  materialPropertiesClosed : L.materialProperties.length = 1000
  radianceEquationClosed : L.radianceEquation
  monteCarloIntegrationClosed : L.monteCarloIntegration
  differentiableLightTransportClosed : L.differentiableLightTransport

def LightTransportClosed (L : LightTransportStructure) : Prop :=
  L.lightSources.length = 100 ∧
  L.materialProperties.length = 1000 ∧
  L.radianceEquation ∧
  L.monteCarloIntegration ∧
  L.differentiableLightTransport

theorem light_transport_closed_from_evidence
    (L : LightTransportStructure) (E : LightTransportEvidence L) :
    LightTransportClosed L := by
  exact And.intro E.lightSourcesClosed
    (And.intro E.materialPropertiesClosed
      (And.intro E.radianceEquationClosed
        (And.intro E.monteCarloIntegrationClosed E.differentiableLightTransportClosed)))

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse