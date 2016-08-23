package ar.edu.unsam.PoiFinder.UI

import grupo5.Colectivo
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

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
		
		new Label(detPanel).text = "Nro. de línea"
		
		//Falta mostrar las cantidades de Paradas de cada Colectivo
//		new Label(detPanel).text = colectivo.linea
//		
//		new Label(detPanel).text = "Cant. de Paradas"
//		new Label(detPanel) => 
//		[
//			value <=> colectivo.parada.size
//		]	
	}
}
