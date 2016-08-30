package ar.edu.unsam.PoiFinder.Model

import grupo5.Colectivo

class DetalleColectivoAppModel extends DetallePoiAppModel
{
	Colectivo colectivo
	
	new(Colectivo colectivo)
	{
		super(colectivo)
		this.colectivo = colectivo
	}
	override String getIcono() {
		"bus.png"
	}
}
