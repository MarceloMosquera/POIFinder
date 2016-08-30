package ar.edu.unsam.PoiFinder.Model

import grupo5.Banco
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DetalleBancoAppModel extends DetallePoiAppModel
{
	Banco banco
	
	new(Banco banco)
	{
		super(banco)
		this.banco = banco
	}
	
	override String getIcono() {
		"bank.png"
	}
}