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
		
		val colDistancia = new Panel(mainPanel)
		colDistancia.layout =  new ColumnLayout(2)
		
		new Label(colDistancia).text = "Distancia"
		
		new TextBox(colDistancia)								//valor de distancia
		
		val col = new Panel(mainPanel)
		col.layout =  new ColumnLayout(4)
		
		new Label(col).text = "Calificiación General"
		
		new TextBox(col)									//valor Calificación
			
		new Label(col).text = "Favorito"
		
		new CheckBox(col).value //<=> "estaAprobada"

		this.crearOpinion(mainPanel)
		this.crearOpinionTexto(mainPanel)
		this.grillaResultados(mainPanel)
		
	}
	
	def crearOpinion(Panel panel)
	{
		val detPanel = new Panel(panel)
		detPanel.layout =  new ColumnLayout(3)
		
		new Label(detPanel).text = "Tu opinión"
		
		new TextBox(detPanel)
		
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
