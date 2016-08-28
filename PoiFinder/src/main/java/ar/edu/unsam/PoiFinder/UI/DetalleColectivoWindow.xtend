package ar.edu.unsam.PoiFinder.UI

import grupo5.Colectivo
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout

class DetalleColectivoWindow extends DetallePoiWindow
{
	new(WindowOwner parent, Colectivo poi)
	{
		super(parent, poi)
	}

	override createChildPanel(Panel detPanel)
	{
		this.title = "Colectivo"
		
		val colectivo = modelObject.poi as Colectivo
		
		val bus = new Panel(detPanel)
		bus.layout =  new ColumnLayout(4)
		
		new Label(bus).text = ""
		new Label(bus).text = "Nro. de línea: "
		new Label(bus).text = colectivo.nombre
		new Label(bus).text = ""
		
		new Label(bus).text = ""
		new Label(bus).text = "Cant. de Paradas: "
		new Label(bus).text = colectivo.parada.size.toString
		new Label(bus).text = ""
	}
}


