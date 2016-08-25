package ar.edu.unsam.PoiFinder.UI

import grupo5.Banco
import grupo5.Cgp
import grupo5.Colectivo
import grupo5.Iop
import org.apache.commons.collections15.Transformer
import org.uqbar.arena.graphics.Image
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.CheckBox
import ar.edu.unsam.PoiFinder.Model.DetallePoiAppModel
import org.uqbar.arena.layout.HorizontalLayout

abstract class DetallePoiWindow  extends Dialog<DetallePoiAppModel>
{
	
	new(WindowOwner parent, Iop poi) {
		super(parent, new DetallePoiAppModel(poi))
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
		      caption = "Cerrar"
		      onClick[ | cerrar  ]
		]
	}

	override protected createFormPanel(Panel mainPanel)
	{
		this.title = "Puntos de interes"

		val detPanel = new Panel(mainPanel)
		detPanel.layout =  new ColumnLayout(2)
		new Label(detPanel).bindImageToProperty("poi", new Transformer<Iop, Image>()
		{
			override transform(Iop poi)
			{
				if (poi instanceof Colectivo ) new Image("bus.png")
				else if (poi instanceof Cgp ) new  Image("cgp.png")
				else if (poi instanceof Banco) new Image("bank.png")
				else (new Image("local.png"))
			}
		}) 
		
        
		new Label(detPanel).text = modelObject.poi.nombre

		createChildPanel(detPanel)
		
		
		new Label(detPanel).text = "Distancia"
		//new Label (detPanel).value = "Distancia"
		
		val col = new Panel(mainPanel)
		col.layout =  new ColumnLayout(2)	
		val columnaIzq = new Panel(col)
		columnaIzq.layout =  new HorizontalLayout	
		new Label(columnaIzq).text = "Calificiación General: "					
		new Label(columnaIzq).text="3,4"//luego se bindea	
		
		val columnaDerecha = new Panel(col)
		columnaDerecha.layout =  new HorizontalLayout	
		new Label(columnaDerecha).text = "Favorito"		
		new CheckBox(columnaDerecha).value //<=> "estaAprobada"

		this.crearOpinion(detPanel)
		this.crearOpinionTexto(mainPanel)
		this.grillaResultados(mainPanel)
		
	}
	
	def crearOpinion(Panel detPanel)
	{
		val opPanel = new Panel(detPanel)
		opPanel.layout =  new ColumnLayout(2)
		val opIzq = new Panel(opPanel)
		new Label(opIzq).text = "Tu opinión"
		
			new TextBox(opIzq)=>[
		     
		      //onClick[ | cerrar  ]
		]
		
		new Selector<Integer>(detPanel) =>
     	[
     		allowNull(false)
    		 //value <=> "productoSeleccionado"
     		//bindItems(new ObservableProperty(["1"]))//.adapter = new PropertyAdapter(typeof(Producto ), "descripcion")
     	]
     	
     	new Button(detPanel) =>
     	[
		      caption = "Enviar"
		      //onClick[ | cerrar  ]
		]
		
	}
	
	def crearOpinionTexto(Panel panel)
	{
		val detPanel = new Panel(panel)
		detPanel.layout =  new ColumnLayout(2)
		
		new Label(detPanel).text = "Opiniones"
		
		new TextBox(detPanel) =>
		[
			fontSize = 30
		]
		
	}
	
	
	def grillaResultados(Panel panel)
	{
		val gridPois = new Table(panel, typeof(Iop)) => [
			height = 200
			numberVisibleRows = 6
			//bindItemsToProperty("poisEncontrados")
			//bindValueToProperty("poiSeleccionado")
			setNumberVisibleRows(5)
		]

		new Column<Iop>(gridPois) =>
		[
			fixedSize = 150
			title = "Usuario"
			bindContentsToProperty("nombre")
		]

		new Column<Iop>(gridPois) =>
		[
			fixedSize = 150
			title = "Comentario"
			bindContentsToProperty("direccion")
		]
		
		new Column<Iop>(gridPois) =>
		[
			fixedSize = 150
			title = "Calificación"
			bindContentsToProperty("direccion")
		]
		
		
	}
	
	def createChildPanel(Panel detPanel)
	{
		
	}
	
	def cerrar ()
	{
		//this.accept
	}
}
