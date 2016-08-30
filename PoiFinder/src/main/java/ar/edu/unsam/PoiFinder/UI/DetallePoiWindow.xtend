package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetallePoiAppModel
import ar.edu.unsam.PoiFinder.Model.LoginAppModel
import grupo5.Banco
import grupo5.Cgp
import grupo5.Colectivo
import grupo5.Opinion
import grupo5.Poi
import org.apache.commons.collections15.Transformer
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

@Accessors
abstract class DetallePoiWindow<T> extends Dialog<DetallePoiAppModel> {

	boolean showDireccionPanel

	new(WindowOwner parent, DetallePoiAppModel appModel) {
		super(parent, appModel)
		showDireccionPanel = true
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "OK"
			onClick[|this.accept]
			width = 100
		]	
			
	}

	def detallePanel(Panel mainPanel) {}

	override protected createFormPanel(Panel mainPanel) {
		this.tituloPanel(mainPanel)
		this.direccionPanel(mainPanel)

		this.detallePanel(mainPanel)

		this.distanciaPanel(mainPanel)
		this.calificacionPanel(mainPanel)
		this.opinionPanel(mainPanel)
	}

	def protected tituloPanel(Panel mainPanel) {

		val tituloPnl = new Panel(mainPanel)
		tituloPnl.layout = new ColumnLayout(2)

		val iconoPnl = new Panel(tituloPnl)
		iconoPnl.layout = new ColumnLayout(2)
		new Label(iconoPnl).text = ""
//		new Label(iconoPnl).bindImageToProperty(
//			"poi",
//			new Transformer<Poi, Image>() {
//				override transform(Poi poi) {
//					if (poi instanceof Colectivo)
//						new Image("bus.png")
//					else if (poi instanceof Cgp)
//						new Image("cgp.png")
//					else if(poi instanceof Banco) new Image("bank.png") else (new Image("local.png"))
//
//				}
//			}
//		)
		new Label(iconoPnl).bindImageToProperty(
			"icono",
			new Transformer<String, Image>() {
				override transform(String icono) {
						new Image(icono)
				}
			}
		)


		val nombrePnl = new Panel(tituloPnl)
		nombrePnl.layout = new ColumnLayout(2)
		new Label(nombrePnl).text = modelObject.poi.nombre
		new Label(nombrePnl).text = ""
	}

	def protected distanciaPanel(Panel mainPanel) {

		// Distancia
		val distanciaPnl = new Panel(mainPanel)
		distanciaPnl.layout = new HorizontalLayout
		new Label(distanciaPnl).text = "Distancia: " + modelObject.distancia.intValue.toString + " km"
	}

	def protected calificacionPanel(Panel mainPanel) {

		// Calificacion y favoritos
		val califPnl = new Panel(mainPanel)
		califPnl.layout = new HorizontalLayout
		new Label(califPnl).text = "Calificación General: "
		new Label(califPnl).text = modelObject.poi.points

		new Label(califPnl).text = "Favorito"
		new CheckBox(califPnl).value <=> "esFavorito"
	}

	def protected opinionPanel(Panel mainPanel) {

		// Tu Opinon
		val opinionPnl = new Panel(mainPanel)
		opinionPnl.layout = new HorizontalLayout
		new Label(opinionPnl).text = "Tu opinión"
		new TextBox(opinionPnl) => [
			value <=> "comentarioUser"
			height = 40 // Altura
			width = 170 // Obtiene o establece el ancho del control.
			multiLine = true
		]

//		val opDer = new Panel(opinionPnl)
//		new Spinner(opDer) => [
//			minimumValue = 1// el valor mínimo que puede tomar
//			maximumValue = 5 // el valor máximo que puede tomar
//			 value <=> "puntaje"
//			// enabled <=>"estasHabilitado"			//indica si está habilitado el control, se asocia a una propiedad que devuelve un boolean.
//		]
		val opDer = new Panel(opinionPnl)
		new Selector<Integer>(opDer) => [
			allowNull(false)
			value <=> "puntaje"
			bindItems(new ObservableProperty(modelObject.poi, "puntajeValoresValidos"))
		]

		new Button(opDer) => [
			caption = "Enviar"
			onClick([|modelObject.enviarComentario()])
		]

		// Opiniones
		val opinionesPnl = new Panel(mainPanel)
		opinionesPnl.layout = new HorizontalLayout
		new Label(opinionesPnl).text = "Opiniones: "

		val gridPois = new Table(mainPanel, typeof(Opinion)) => [
			// height = 200
			numberVisibleRows = 6
			bindItemsToProperty("opinionesDelPoi")
//			bindValueToProperty("poiSeleccionado")
			setNumberVisibleRows(5)
		]

		new Column<Opinion>(gridPois) => [
			fixedSize = 100
			title = "Usuario"
			bindContentsToProperty("user.nombre")
		]

		new Column<Opinion>(gridPois) => [
			fixedSize = 100
			title = "Comentario"
			bindContentsToProperty("coment")
		]

		new Column<Opinion>(gridPois) => [
			fixedSize = 100
			title = "Calificación"
			bindContentsToProperty("puntaje")
		]

	}

	def protected direccionPanel(Panel mainPanel) {
		if(!showDireccionPanel) return
		val panelDetalles = new Panel(mainPanel)
		panelDetalles.layout = new HorizontalLayout
		new Label(panelDetalles).text = "Dirección: " + modelObject.poi.direccion
	}

}
