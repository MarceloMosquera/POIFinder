package ar.edu.unsam.PoiFinder.UI

import grupo5.Colectivo

class DetalleColectivoAppModel extends DetallePoiAppModel
{
	Colectivo colectivo
	
	new(Colectivo colectivo)
	{
		super(colectivo)
		this.colectivo = colectivo
	}
}
