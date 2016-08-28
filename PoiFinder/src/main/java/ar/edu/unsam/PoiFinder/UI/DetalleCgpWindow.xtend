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
		
		val cgpPanel = new Panel(detPanel)
		cgpPanel.layout =  new ColumnLayout(4)
		
		new Label(cgpPanel).text = ""
		new Label(cgpPanel).text = "Barrio: "
		new Label(cgpPanel).text = cgp.barrio
		new Label(cgpPanel).text = ""
		
		new Label(cgpPanel).text = ""
		new Label(cgpPanel).text = "Direccion: "
		new Label(cgpPanel).text = cgp.direccion
		new Label(cgpPanel).text = ""
		
		new Label(cgpPanel).text = ""
		new Label(cgpPanel).text = "Servicios: "
		
		val column =new Panel(cgpPanel)
		column.layout =new ColumnLayout(2)
		val izq = new Panel(column)
		izq.layout = new VerticalLayout()
		cgp.servicios.forEach[c|new Label(izq).text = c.nombre]
		val mid = new Panel(column)
		mid.layout = new VerticalLayout()
		cgp.servicios.forEach[c|new Label(mid).text = c.stringHorario]
//		val der = new Panel(column)
//		der.layout = new VerticalLayout()
//		cgp.servicios.forEach[c|new Label(der).text = c.stringDias]
//		
		new Label(cgpPanel).text = ""
		
	}
	
}
