package ar.edu.unsam.PoiFinder.UI

import grupo5.Banco
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unsam.PoiFinder.Model.DetalleBancoAppModel

class DetalleBancoWindow  extends DetallePoiWindow<DetalleBancoAppModel>
{
	
	new(WindowOwner parent, Banco poi)
	{
		super(parent, new DetalleBancoAppModel(poi))
	}
	
	override createChildPanel(Panel detPanel)
	{
		this.title = "Banco"
		
		val banco = modelObject.poi as Banco
		
		val bank = new Panel(detPanel)
		bank.layout =  new ColumnLayout(4)
		
		new Label(bank).text = ""
		new Label(bank).text = "Direccion: "
		new Label(bank).text = banco.direccion
		new Label(bank).text = ""
		
		new Label(bank).text = ""
		new Label(bank).text = "Barrio: "
		new Label(bank).text = banco.barrio
		new Label(bank).text = ""
	
		new Label(bank).text = ""
		new Label(bank).text = "Servicios: "

		val bankServices = new Panel(bank)
		bankServices.layout = new VerticalLayout
		banco.servicio.forEach[b|new Label(bankServices).text = b]
		new Label(bankServices).text = ""
		
		new Label(bank).text = ""
	}
}
