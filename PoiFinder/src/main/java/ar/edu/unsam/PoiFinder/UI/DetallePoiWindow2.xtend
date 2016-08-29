package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetallePoiAppModel
import grupo5.Banco
import grupo5.Cgp
import grupo5.Colectivo
import grupo5.Local
import grupo5.Poi
import org.apache.commons.collections15.Transformer
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Spinner
import grupo5.Opinion
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

abstract class DetallePoiWindow2 extends Dialog<DetallePoiAppModel> {

	new(WindowOwner owner, DetallePoiAppModel model) {
		super(owner, model)
	// this.onAccept[|this.close]
	}

	def protected boton(Panel mainPanel) {
		super.createActionsPanel(mainPanel)

		new Button(mainPanel) => [
			caption = "OK"
			onClick[|this.accept]
			width = 100
		]
	}

	def protected segundaEntrega(Panel mainPanel) {
		
		//Distancia
		val distanciaLayout = new Panel(mainPanel)
		distanciaLayout.layout = new HorizontalLayout	
		new Label(distanciaLayout).text = "Distancia: "+ modelObject.distancia.intValue.toString + " km"

		// Calificacion y favoritos
		val finalaLayout = new Panel(mainPanel)
		finalaLayout.layout = new HorizontalLayout 
		new Label(finalaLayout).text = "Calificación General: "
		new Label(finalaLayout).text = modelObject.poi.points// luego se bindea
		
		new Label(finalaLayout).text = "Favorito"
		new CheckBox(finalaLayout).value // <=> "estaAprobada"
		
		// Tu Opinon
		val opinionLayout = new Panel(mainPanel)
		opinionLayout.layout = new HorizontalLayout
		new Label(opinionLayout).text = "Tu opinión"
		new TextBox(opinionLayout) => [
			// value <=> "comentarioUser"
			height = 40 // Altura
			width = 170 // Obtiene o establece el ancho del control.
			multiLine = true
		]

		val opDer = new Panel(opinionLayout)
		new Spinner(opDer) => [
			minimumValue = 1// el valor mínimo que puede tomar
			maximumValue = 5 // el valor máximo que puede tomar
			 value <=> "puntaje"
			// enabled <=>"estasHabilitado"			//indica si está habilitado el control, se asocia a una propiedad que devuelve un boolean.
		]

		new Button(opDer) => [
			caption = "Enviar"
			onClick([|modelObject.enviarComentario()])
		]

		// Opiniones
		val opinionesLayout = new Panel(mainPanel)
		opinionesLayout.layout = new HorizontalLayout
		new Label(opinionesLayout).text = "Opiniones: "
		
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
		
		
		 this.boton(mainPanel)
	}

}

class IconosPoi extends DetallePoiWindow2 {

	new(WindowOwner owner, DetallePoiAppModel model) {
		super(owner, model)

	}

	def protected icono(Panel mainPanel) {
				
		val iconoLayout1 = new Panel(mainPanel)
		iconoLayout1.layout = new  ColumnLayout(2)
				
		val iconoLayout2 = new Panel(iconoLayout1)
		iconoLayout2.layout = new  ColumnLayout(2)	
		new Label(iconoLayout2).text = "" 
		new Label(iconoLayout2).bindImageToProperty(
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
		
		val iconoLayout3 = new Panel(iconoLayout1)
		iconoLayout3.layout = new  ColumnLayout(2)			
		new Label(iconoLayout3).text = modelObject.poi.nombre
		new Label(iconoLayout3).text = ""
	}

	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}

class DetallesParadaWindow extends IconosPoi {

	new(WindowOwner owner, DetallePoiAppModel model) {
		super(owner, model)
		this.title = "Línea de colectivo"
		this.taskDescription = "Los detalles son los siguientes: "
	}

	override protected createFormPanel(Panel mainPanel) {
		this.icono(mainPanel)
		val colectivo = modelObject.poi as Colectivo // Preguntar que es esto?
		
		val paradasLayout = new Panel(mainPanel)
		paradasLayout.layout = new HorizontalLayout
		new Label(paradasLayout).text = "Cant. de Paradas: "+ colectivo.parada.size.toString
		
		
		this.segundaEntrega(mainPanel)
	}
}

@Accessors
abstract class DetallesConDireccionWindow extends IconosPoi {

	Panel panelDetalles

	new(WindowOwner owner, DetallePoiAppModel model) {
		super(owner, model)
	}

	def protected direccion(Panel mainPanel) {
		panelDetalles = new Panel(mainPanel)
		panelDetalles.layout = new HorizontalLayout
		new Label(panelDetalles).text = "Dirección: "+ modelObject.poi.direccion
	}

}

class DetallesLocalComWindow extends DetallesConDireccionWindow {

	new(WindowOwner owner, DetallePoiAppModel model) {
		super(owner, model)
		this.title = "Local Comercial"
		this.taskDescription = "Los detalles son los siguientes: "
	}

	override protected createFormPanel(Panel mainPanel) {
		this.icono(mainPanel)
		this.direccion(mainPanel)
		val local = modelObject.poi as Local
		
		val localLayout = new Panel(mainPanel)
		localLayout.layout = new HorizontalLayout
		new Label(localLayout).text = "Rubro: "+ local.categoria
		
		this.segundaEntrega(mainPanel)
	}
}

class DetallesCGPWindow extends DetallesConDireccionWindow {

	new(WindowOwner owner, DetallePoiAppModel model) {
		super(owner, model)
		this.title = "CGP"
		this.taskDescription = "Los detalles son los siguientes:"
	}

	// Verificar si esto sirve para detectar errores: jorge
//	override protected createMainTemplate(Panel mainPanel) {
//		super.createErrorsPanel(mainPanel)
//		this.createFormPanel(mainPanel)
//		//this.crearLista(mainPanel)
//		super.createActionsPanel(mainPanel)
//	}
	override protected createFormPanel(Panel mainPanel) {
		this.icono(mainPanel)
		this.direccion(mainPanel)
		this.crearLista(mainPanel)
		this.segundaEntrega(mainPanel)
	}

	def crearLista(Panel mainPanel) {
		val Panel serviciosLayout = new Panel(mainPanel)
		serviciosLayout.layout = new HorizontalLayout
		new Label(serviciosLayout).text = "Servicios: "

				
		val Panel contenidoLayoutNombre = new Panel(mainPanel)
		contenidoLayoutNombre.layout = new ColumnLayout(3)
		val Panel contenidoLayoutHorario = new Panel(mainPanel)
		contenidoLayoutHorario.layout = new ColumnLayout(3)
		val Panel contenidoLayoutDias = new Panel(mainPanel)
		contenidoLayoutDias.layout = new ColumnLayout(3)
		
		val cgp = modelObject.poi as Cgp
		cgp.servicios.forEach [ c |
			new Label(contenidoLayoutNombre).text = c.nombre 
			new Label(contenidoLayoutHorario).text = "Horario: "+c.stringHorario  
			new Label(contenidoLayoutDias).text = "Días: "+ c.stringDias
		]
	}
}

class DetallesBancoWindow extends DetallesCGPWindow {

	new(WindowOwner owner, DetallePoiAppModel model) {
		super(owner, model)
		this.title = "Banco"
		this.taskDescription = "Los detalles son los siguientes:"
	}

	override crearLista(Panel mainPanel) {
		val Panel serviciosLayout = new Panel(mainPanel)
		serviciosLayout.layout = new HorizontalLayout
		new Label(serviciosLayout).text = "Servicios: "
		val banco = modelObject.poi as Banco
		banco.servicio.forEach[b|new Label(serviciosLayout).text = b]
	}

}
