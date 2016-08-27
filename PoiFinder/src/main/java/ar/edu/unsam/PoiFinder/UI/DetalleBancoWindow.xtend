package ar.edu.unsam.PoiFinder.UI

import grupo5.Banco
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class DetalleBancoWindow  extends DetallePoiWindow {
	
	new(WindowOwner parent, Banco poi) {
		super(parent, poi)
	}

	
	override createChildPanel(Panel detPanel)
	{
		this.title = "Banco"
		val banco = modelObject.poi as Banco
		new Label(detPanel).text = "Direccion"
		new Label(detPanel).text = banco.direccion
		new Label(detPanel).text = "Barrio"
		new Label(detPanel).text = banco.barrio
		new Label(detPanel).text = "Servicios"
//		val ser = new Panel(detPanel)
//		ser.layout = new VerticalLayout
		banco.servicio.forEach[s|new Label(detPanel).text=s]
		new Label(detPanel).text = ""

	}
}
