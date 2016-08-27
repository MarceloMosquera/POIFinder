package ar.edu.unsam.PoiFinder.UI

import grupo5.Local
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout

class DetalleLocalWindow  extends DetallePoiWindow {
	
	new(WindowOwner parent, Local poi) {
		super(parent, poi)
	}

	
	override createChildPanel(Panel detPanel)
	{
		this.title = "Local"
		val local = modelObject.poi as Local

		val b = new Panel(detPanel)
		b.layout =  new ColumnLayout(4)
		
		new Label(b).text = ""
		new Label(b).text = "Direccion"
		new Label(b).text = local.direccion
		new Label(b).text = ""
		
		new Label(b).text = ""
		new Label(b).text = "Categoria"
		new Label(b).text = local.categoria
		new Label(b).text = ""
	}
}
