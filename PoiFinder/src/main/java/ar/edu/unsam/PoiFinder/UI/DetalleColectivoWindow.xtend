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
		
		val b = new Panel(detPanel)
		b.layout =  new ColumnLayout(4)
		
		new Label(b).text = ""
		new Label(b).text = "Nro. de línea"
		new Label(b).text = colectivo.nombre
		new Label(b).text = ""
		
		new Label(b).text = ""
		new Label(b).text = "Cant. de Paradas"
		new Label(b).text = colectivo.parada.size.toString
		new Label(b).text = ""
	}
}


