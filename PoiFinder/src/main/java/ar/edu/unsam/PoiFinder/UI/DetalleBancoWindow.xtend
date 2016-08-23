package ar.edu.unsam.PoiFinder.UI

import grupo5.Local
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import grupo5.Banco

class DetalleBancoWindow  extends DetallePoiWindow {
	
	new(WindowOwner parent, Banco poi) {
		super(parent, poi)
	}

	
	override createChildPanel(Panel detPanel)
	{
		val banco = modelObject.poi as Banco
		new Label(detPanel).text = "Direccion"
		new Label(detPanel).text = banco.direccion
		new Label(detPanel).text = "Barrio"
		new Label(detPanel).text = banco.barrio
		new Label(detPanel).text = ""
		new Label(detPanel).text = "Servicios"
		
	}
}