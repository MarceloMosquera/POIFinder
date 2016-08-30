package ar.edu.unsam.PoiFinder.Model


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import grupo5.Cgp

@Observable
@Accessors
class DetalleCgpAppModel extends DetallePoiAppModel
{
	
	Cgp cgp
	
	new(Cgp cgp)
	{
		super(cgp)
		this.cgp = cgp
	}
	
	override String getIcono() {
		"cgp.png"
	}
}