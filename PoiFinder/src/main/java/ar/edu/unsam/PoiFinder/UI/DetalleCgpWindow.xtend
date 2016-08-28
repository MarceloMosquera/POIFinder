package ar.edu.unsam.PoiFinder.UI

import grupo5.Cgp
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.VerticalLayout

class DetalleCgpWindow  extends DetallePoiWindow
{	
	new(WindowOwner parent, Cgp poi)
	{
		super(parent, poi)
	}
		
	override createChildPanel(Panel detPanel)
	{
		this.title = "Cgp"
		
		val cgp = modelObject.poi as Cgp
		
		val cegepe = new Panel(detPanel)
		cegepe.layout =  new ColumnLayout(4)
		
		new Label(cegepe).text = ""
		new Label(cegepe).text = "Barrio: "
		new Label(cegepe).text = cgp.barrio
		new Label(cegepe).text = ""
		
		new Label(cegepe).text = ""
		new Label(cegepe).text = "Direccion: "
		new Label(cegepe).text = cgp.direccion
		new Label(cegepe).text = ""
		
		new Label(cegepe).text = ""
		new Label(cegepe).text = "Servicios: "

		val cegepeServices = new Panel(cegepe)
		cegepeServices.layout = new VerticalLayout()
		cgp.servicio.forEach[c|new Label(cegepeServices).text = c]
		new Label(cegepeServices).text = ""
	}
	
}
