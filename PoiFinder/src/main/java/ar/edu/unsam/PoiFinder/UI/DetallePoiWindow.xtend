package ar.edu.unsam.PoiFinder.UI

import grupo5.Iop
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class DetallePoiWindow  extends Dialog<DetallePoiAppModel> {
	
	new(WindowOwner parent, Iop poi) {
		super(parent, new DetallePoiAppModel(poi))
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
		      caption = "Cerrar"
		      onClick[ | cerrar  ]
		]
	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Puntos de interes"

		val detPanel = new Panel(mainPanel)
		detPanel.layout =  new ColumnLayout(2)
		new Label(detPanel).text = "Icono"
		new Label(detPanel).text = modelObject.poi.nombre

		createChildPanel(detPanel)
		
	}
	
	def createChildPanel(Panel detPanel)
	{
		
	}
	
	def cerrar () {
		this.accept
	}
}