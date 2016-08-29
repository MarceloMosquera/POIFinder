package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetallePoiAppModel
import grupo5.Banco
import grupo5.Cgp
import grupo5.Colectivo
import org.apache.commons.collections15.Transformer
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Spinner
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import grupo5.Opinion
import grupo5.Poi

abstract class DetallePoiWindow<T> extends Dialog<DetallePoiAppModel> {

	new(WindowOwner parent, DetallePoiAppModel appModel) {
		super(parent, appModel)
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "OK"
			onClick[|this.accept]
		]
	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Puntos de interes"

		mainPanel.layout = new VerticalLayout

		val pnlTitulo = new Panel(mainPanel)
		pnlTitulo.layout = new ColumnLayout(4)
		new Label(pnlTitulo).bindImageToProperty(
			"poi",
			new Transformer<Poi, Image>() {
				override transform(Poi poi) {
					if (poi instanceof Colectivo)
						new Image("bus.png")
					else if (poi instanceof Cgp)
						new Image("cgp.png")
					else if(poi instanceof Banco) new Image("bank.png") else (new Image("local.png"))
				}
			}
		)
		new Label(pnlTitulo).text = " "
		new Label(pnlTitulo).text = modelObject.poi.nombre
		new Label(pnlTitulo).text = " "

		createChildPanel(mainPanel)

		val pnlReview = new Panel(mainPanel)
		pnlReview.layout = new VerticalLayout

		val pnlDistancia = new Panel(pnlReview)
		pnlDistancia.layout = new ColumnLayout(4)
		new Label(pnlDistancia).text = " "
		new Label(pnlDistancia).text = "Distancia"
		new Label(pnlDistancia).text = modelObject.distancia.intValue.toString + " km"
		new Label(pnlDistancia).text = " "

		new Label(pnlDistancia).text = "Calificación General: "
		new Label(pnlDistancia).text = "3,4" // luego se bindea	
		new Label(pnlDistancia).text = "Favorito"
		new CheckBox(pnlDistancia).value // <=> "estaAprobada"
		this.panelRedactarOpinion(mainPanel)

		this.grillaOpiniones(mainPanel)
	}

	def void panelRedactarOpinion(Panel panel) {
		val opPanel = new Panel(panel)
		opPanel.layout = new ColumnLayout(2)

		this.crearOpinionIzq(opPanel)

		this.crearOpinionDer(opPanel)
	}

	def void crearOpinionIzq(Panel panel) {
		val opIzq = new Panel(panel)
		opIzq.layout = new HorizontalLayout
		new Label(opIzq).text = "Tu opinión"
		new TextBox(opIzq) => [
			value <=> "comentarioUser"
			height = 40 // Altura
			width = 170 // Obtiene o establece el ancho del control.
			multiLine = true

		// enabled
		// visible = false
		// multilineb.true
		// onClick[ | cerrar  ]
		]
	}

	def void crearOpinionDer(Panel panel) {
		val columnaDerechaOpinion = new Panel(panel)
		columnaDerechaOpinion.layout = new VerticalLayout

		new Label(columnaDerechaOpinion).text = "     "

		new Spinner(columnaDerechaOpinion) => [
			minimumValue = 1 // el valor mínimo que puede tomar
			maximumValue = 5 // el valor máximo que puede tomar
			value <=> "puntaje"
		// enabled <=>"estasHabilitado"			//indica si está habilitado el control, se asocia a una propiedad que devuelve un boolean.
		]

		new Button(columnaDerechaOpinion) => [
			caption = "Enviar"
			onClick([|modelObject.enviarComentario()])
		]
	}

	def void grillaOpiniones(Panel panel) {
		val pnlGrilla = new Panel(panel)
		pnlGrilla.layout = new VerticalLayout
		new Label(pnlGrilla).text = "Opiniones: "
		val gridPois = new Table(pnlGrilla, typeof(Opinion)) => [
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

	def createChildPanel(Panel detPanel) {
	}

//	def cerrar() {
//		this.close
//	}
}
