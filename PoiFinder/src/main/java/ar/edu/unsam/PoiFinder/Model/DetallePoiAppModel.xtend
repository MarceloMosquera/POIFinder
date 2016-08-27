package ar.edu.unsam.PoiFinder.Model

import grupo5.Iop
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DetallePoiAppModel extends BaseAppModel
{
	Iop poi

	new (Iop poi)
	{
		this.poi = poi
	}

	//Para hablilitar o deahabilitar un control, de ser necesario
	boolean estasHabilitado
	
	def boolean getEstasHabilitado()
	{
		true
	}
	
	
}

