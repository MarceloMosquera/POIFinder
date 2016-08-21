package ar.edu.unsam.PoiFinder.UI

import grupo5.Iop
import grupo5.Local
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class BusquedaWindow extends SimpleWindow<BusquedaAppModel> {

	new(WindowOwner parent) {
		super(parent, new BusquedaAppModel)
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Ver Poi"
			enabled <=> "hayPoiSeleccionado"
			onClick([|this.verDetalle])
		]
	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Búsqueda de puntos de interes"

		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)

			new Label(it).text = "Criterio de busqueda"
			new Label(it).text = ""
			new Label(it).text = "Nombre"
			new Label(it).text = ""

			new TextBox(it) => [
				value <=> "nombreDePoiABuscar"
				width = 200
			]
			new Button(it) => [
				caption = "Buscar"
				 onClick([|modelObject.search])
			]

			new Label(it).text = "Resultados"

		]

		val gridPois = new Table(mainPanel, typeof(Iop)) => [
			height = 200
			numberVisibleRows = 6
			bindItemsToProperty("poisEncontrados")
			bindValueToProperty("poiSeleccionado")
			setNumberVisibleRows(5)
		]

		new Column<Iop>(gridPois) => [
			fixedSize = 150
			title = "Nombre"
			bindContentsToProperty("nombre")
		]

		new Column<Iop>(gridPois) => [
			fixedSize = 150
			title = "Direccion"
			bindContentsToProperty("direccion")
		]

	}
	
	def verDetalle()
	{
		openDialog(getDetalleWindow(modelObject.poiSeleccionado))
	}
	def dispatch getDetalleWindow(Local poi)
	{
		new DetalleLocalWindow(this, poi)
	}
	def dispatch getDetalleWindow(Iop poi)
	{
		new DetallePoiWindow(this, poi)
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

}
