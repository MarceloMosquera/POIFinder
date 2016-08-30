package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetalleLocalAppModel
import grupo5.Local
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class DetalleLocalWindow  extends DetallePoiWindow<DetalleLocalAppModel>
{
	
	new(WindowOwner parent, Local poi)
	{
		super(parent, new DetalleLocalAppModel(poi))
		this.title = "Local Comercial"
		this.taskDescription = "Los detalles son los siguientes: "
	}

	override detallePanel(Panel mainPanel){
		val local = modelObject.poi as Local
		val localLayout = new Panel(mainPanel)
		localLayout.layout = new HorizontalLayout
		new Label(localLayout).text = "Rubro: "+ local.categoria
	}


}
