package ar.edu.unsam.PoiFinder.UI

import grupo5.Cgp
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout

class DetalleCgpWindow  extends DetallePoiWindow {
	
	new(WindowOwner parent, Cgp poi) {
		super(parent, poi)
	}

	
	override createChildPanel(Panel detPanel)
	{
		this.title = "Cgp"
		val cgp = modelObject.poi as Cgp
		new Label(detPanel).text = "Barrio"
		new Label(detPanel).text = cgp.barrio
		new Label(detPanel).text = "Direccion"
		new Label(detPanel).text = cgp.direccion
		new Label(detPanel).text = "Servicios"	
			
		new Panel(detPanel) => [
			val izq = new Panel(it)
			izq.layout = new VerticalLayout
			val der = new Panel(it)
			der.layout = new VerticalLayout
			layout = new ColumnLayout(2)
			cgp.servicios.forEach[s|new Label(izq).text=s.nombre]
			cgp.servicios.forEach[s|new Label(der).text=s.horarioss]
		new Label(detPanel).text = ""
		]
	}
	
}