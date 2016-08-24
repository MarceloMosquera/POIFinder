package ar.edu.unsam.PoiFinder.Model

import grupo5.Colectivo

class DetalleColectivoAppModel extends ar.edu.unsam.PoiFinder.UI.DetallePoiAppModel
{
	Colectivo colectivo
	
	new(Colectivo colectivo)
	{
		super(colectivo)
		this.colectivo = colectivo
	}
}
