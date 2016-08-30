package ar.edu.unsam.PoiFinder.Model

import grupo5.Local
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DetalleLocalAppModel extends DetallePoiAppModel
{
	
	Local local
	
	new(Local local)
	{
		super(local)
		this.local = local
	}
	
	override String getIcono() {
		"local.png"
	}
}