package ar.edu.unsam.PoiFinder.UI

import grupo5.Banco
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout

class DetalleBancoWindow  extends DetallePoiWindow
{
	
	new(WindowOwner parent, Banco poi)
	{
		super(parent, poi)
	}
	
	override createChildPanel(Panel detPanel)
	{
		this.title = "Banco"
		
		val banco = modelObject.poi as Banco
		
		val banck = new Panel(detPanel)
		banck.layout =  new ColumnLayout(4)
		
		new Label(banck).text = ""
		new Label(banck).text = "Direccion: "
		new Label(banck).text = banco.direccion
		new Label(banck).text = ""
		
		new Label(banck).text = ""
		new Label(banck).text = "Barrio: "
		new Label(banck).text = banco.barrio
		new Label(banck).text = ""
	
		new Label(banck).text = ""
		new Label(banck).text = "Servicios: "

		val banckServices = new Panel(banck)
		banckServices.layout = new VerticalLayout
		banco.servicio.forEach[b|new Label(banckServices).text = b]
		new Label(banckServices).text = ""
	}
}
