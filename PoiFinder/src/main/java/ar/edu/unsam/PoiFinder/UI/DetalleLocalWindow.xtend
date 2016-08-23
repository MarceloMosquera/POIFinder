package ar.edu.unsam.PoiFinder.UI

import grupo5.Local
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class DetalleLocalWindow  extends DetallePoiWindow {
	
	new(WindowOwner parent, Local poi) {
		super(parent, poi)
	}

	
	override createChildPanel(Panel detPanel)
	{
		this.title = "Local"
		val local = modelObject.poi as Local
		new Label(detPanel).text = "Direccion"
		new Label(detPanel).text = local.direccion
		new Label(detPanel).text = "Categoria"
		new Label(detPanel).text = local.categoria
		
	}
}