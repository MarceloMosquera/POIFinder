package ar.edu.unsam.PoiFinder.Model

import grupo5.Iop
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unsam.PoiFinder.Model.BaseAppModel

@Observable
@Accessors
class DetallePoiAppModel extends BaseAppModel
{
	Iop poi
	new(Iop poi) {
		this.poi = poi
	}
}