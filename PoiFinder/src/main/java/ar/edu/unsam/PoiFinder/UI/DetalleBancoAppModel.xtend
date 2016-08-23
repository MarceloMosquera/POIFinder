package ar.edu.unsam.PoiFinder.UI

import grupo5.Iop
import grupo5.Local
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import grupo5.Banco

@Observable
@Accessors
class DetalleBancoAppModel extends DetallePoiAppModel {
	
	Banco banco
	
	new(Banco banco) {
		super(banco)
		this.banco = banco
	}
}