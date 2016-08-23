package ar.edu.unsam.PoiFinder.UI

import grupo5.Iop
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.apache.commons.collections15.Transformer
import org.uqbar.arena.graphics.Image
import grupo5.Colectivo
import grupo5.Cgp
import grupo5.Banco

 abstract class DetallePoiWindow  extends Dialog<DetallePoiAppModel> {
	
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
		new Label(detPanel).bindImageToProperty("poi", new Transformer<Iop, Image>() {
			override transform(Iop poi) {
				if (poi instanceof Colectivo ) new Image("bus.png")
				else if (poi instanceof Cgp ) new  Image("cgp.png")
				else if (poi instanceof Banco) new Image("bank.png")
				else (new Image("local.png"))
			}
		}) 
		
        
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