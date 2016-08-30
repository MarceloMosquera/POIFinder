package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetalleCgpAppModel
import grupo5.Cgp
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class DetalleCgpWindow  extends DetallePoiWindow<DetalleCgpAppModel>
{	
	new(WindowOwner parent, Cgp poi)
	{
		super(parent, new DetalleCgpAppModel(poi))
		this.title = "CGP"
		this.taskDescription = "Los detalles son los siguientes:"
	}
		
	override detallePanel(Panel mainPanel) {
		
		val serviciosPnl = new Panel(mainPanel)
		serviciosPnl.layout = new HorizontalLayout
		new Label(serviciosPnl).text = "Servicios: "
				
		val contenidoNombrePnl = new Panel(mainPanel)
		contenidoNombrePnl.layout = new ColumnLayout(3)
		val contenidoHorarioPnl = new Panel(mainPanel)
		contenidoHorarioPnl.layout = new ColumnLayout(3)
		val contenidoDiasPnl = new Panel(mainPanel)
		contenidoDiasPnl.layout = new ColumnLayout(3)
		
		val cgp = modelObject.poi as Cgp
		cgp.servicios.forEach [ c |
			new Label(contenidoNombrePnl).text = c.nombre 
			new Label(contenidoHorarioPnl).text = "Horario: "+c.stringHorario  
			new Label(contenidoDiasPnl).text = "Días: "+ c.stringDias
		]
		""
	}
	
}
