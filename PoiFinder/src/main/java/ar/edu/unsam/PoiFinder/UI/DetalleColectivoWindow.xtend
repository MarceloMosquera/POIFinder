package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetalleColectivoAppModel
import grupo5.Colectivo
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class DetalleColectivoWindow extends DetallePoiWindow<DetalleColectivoAppModel>
{
	new(WindowOwner parent, Colectivo poi)
	{
		super(parent, new DetalleColectivoAppModel(poi))
		this.title = "Línea de colectivo"
		this.taskDescription = "Los detalles son los siguientes: "
		this.showDireccionPanel = false
	}

	override detallePanel(Panel mainPanel) {
		val colectivo = modelObject.poi as Colectivo 
		val paradasLayout = new Panel(mainPanel)
		paradasLayout.layout = new HorizontalLayout
		new Label(paradasLayout).text = "Cant. de Paradas: "+ colectivo.parada.size.toString
	}
}


