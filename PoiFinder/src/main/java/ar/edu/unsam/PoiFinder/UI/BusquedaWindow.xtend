package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.BusquedaAppModel
import ar.edu.unsam.PoiFinder.Model.DetallePoiAppModel
import grupo5.Banco
import grupo5.Cgp
import grupo5.Colectivo
import grupo5.Local
import grupo5.Poi
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
import ar.edu.unsam.PoiFinder.Model.DetalleLocalAppModel
import ar.edu.unsam.PoiFinder.Model.PoiBusquedaModel
import org.uqbar.arena.layout.HorizontalLayout

class BusquedaWindow extends SimpleWindow<BusquedaAppModel> {

	new(WindowOwner parent, BusquedaAppModel model) {
		super(parent, model)
		this.title = "Busqueda de puntos de interes"
		taskDescription = "Usuario: " + model.getUsuarioLogueado.nombre
	}

	override protected addActions(Panel actionsPanel) {
		actionsPanel.layout = new ColumnLayout(2)

		new Button(actionsPanel) => [
			caption = "Cerrar Sesión"
			onClick[|
				this.close
				new LoginWindow(this).open
			]
			width = 100
		]


		new Button(actionsPanel) => [
			caption = "Ver Poi"
			enabled <=> "hayPoiSeleccionado"
			onClick([|this.verDetalle])
			
		]

	}

	override protected createFormPanel(Panel mainPanel) {

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

		val gridPois = new Table(mainPanel, typeof(PoiBusquedaModel)) => [
			height = 200
			numberVisibleRows = 6
			bindItemsToProperty("poisEncontrados")
			bindValueToProperty("poiSeleccionado")
			setNumberVisibleRows(5)
		]

		new Column<PoiBusquedaModel>(gridPois) => [
			fixedSize = 150
			title = "Nombre"
			bindContentsToProperty("poi.nombre")
		]

		new Column<PoiBusquedaModel>(gridPois) => [
			fixedSize = 150
			title = "Direccion"
			bindContentsToProperty("poi.direccion")
		]
		new Column<PoiBusquedaModel>(gridPois) => [
			fixedSize = 45
			title = "Cerca"
			bindContentsToProperty("estaCerca").transformer = [boolean get|if(get) "Si" else "No"]
		]
		new Column<PoiBusquedaModel>(gridPois) => [
			fixedSize = 55
			title = "Favorito"
			bindContentsToProperty("favorito").transformer = [boolean get|if(get) "★" else ""]
		]
	}

	def verDetalle() {
		openDialog(getDetalleWindow(modelObject.poiSeleccionado.poi))
	}

	def dispatch getDetalleWindow(Local poi) {
		new DetalleLocalWindow(this, poi)
	}

	def dispatch getDetalleWindow(Banco poi) {
		new DetalleBancoWindow(this, poi)
	}

	def dispatch getDetalleWindow(Cgp poi) {
		new DetalleCgpWindow(this, poi)
	}

	def dispatch getDetalleWindow(Colectivo poi) {
		new DetalleColectivoWindow(this, poi)
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

}
