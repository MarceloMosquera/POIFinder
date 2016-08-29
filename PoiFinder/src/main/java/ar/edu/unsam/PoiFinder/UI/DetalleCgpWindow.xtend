package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetalleCgpAppModel
import grupo5.Cgp
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class DetalleCgpWindow  extends DetallePoiWindow<DetalleCgpAppModel>
{	
	new(WindowOwner parent, Cgp poi)
	{
		super(parent, new DetalleCgpAppModel(poi))
	}
		
	override createChildPanel(Panel detPanel)
	{
		this.title = "Cgp"
		
		val cgp = modelObject.poi as Cgp
		
		val cgpPanel = new Panel(detPanel)
		cgpPanel.layout =  new ColumnLayout(4)
		//detPanel.width=12
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
		new Label(cgpPanel).text = ""
		new Label(cgpPanel).text = ""

		cgp.servicios.forEach[c|
			new Label(cgpPanel).text = ""
			new Label(cgpPanel).text = c.nombre
			new Label(cgpPanel).text = c.stringHorario
			new Label(cgpPanel).text = c.stringDias
		]
		
		new Label(cgpPanel).text = ""
		
	}
	
}
