package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetalleLocalAppModel
import grupo5.Local
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class DetalleLocalWindow  extends DetallePoiWindow<DetalleLocalAppModel>
{
	
	new(WindowOwner parent, Local poi)
	{
		super(parent, new DetalleLocalAppModel(poi))
	}

	override createChildPanel(Panel detPanel)
	{
		this.title = "Local"
		
		val local = modelObject.poi as Local

		val loc = new Panel(detPanel)
		loc.layout =  new ColumnLayout(4)
		
		new Label(loc).text = ""
		new Label(loc).text = "Direccion: "
		new Label(loc).text = local.direccion
		new Label(loc).text = ""
		
		new Label(loc).text = ""
		new Label(loc).text = "Categoria: "
		new Label(loc).text = local.categoria
		new Label(loc).text = ""
	}
}
