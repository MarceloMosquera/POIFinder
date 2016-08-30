package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetalleBancoAppModel
import grupo5.Banco
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class DetalleBancoWindow  extends DetallePoiWindow<DetalleBancoAppModel>
{
	
	new(WindowOwner parent, Banco poi)
	{
		super(parent, new DetalleBancoAppModel(poi))
		this.title = "Banco"
		this.taskDescription = "Los detalles son los siguientes:"
	}
	
	override detallePanel(Panel mainPanel) {
		val Panel serviciosLayout = new Panel(mainPanel)
		serviciosLayout.layout = new HorizontalLayout
		new Label(serviciosLayout).text = "Servicios: "
		val banco = modelObject.poi as Banco
		banco.servicio.forEach[b|new Label(serviciosLayout).text = b]
		""
	}
}
