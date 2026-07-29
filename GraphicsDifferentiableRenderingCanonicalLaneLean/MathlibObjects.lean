import GraphicsDifferentiableRenderingCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace GraphicsDifferentiableRenderingCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GraphicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GraphicsAdmittedObject where
  space : GraphicsSpace
  differentiableManifold : Prop
  renderingPipeline : Prop
  pixelModel : Type
  pixelTopology : TopologicalSpace pixelModel
  differentiableRendering : Prop
  conclusion : differentiableRendering

structure GraphicsEndgameState where
  object : GraphicsAdmittedObject

def GraphicsWitnessClosed (O : GraphicsAdmittedObject) : Prop :=
  O.differentiableRendering

end GraphicsDifferentiableRenderingCanonicalLaneLean
end HautevilleHouse