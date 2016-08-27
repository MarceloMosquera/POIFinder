package ar.edu.unsam.PoiFinder.UI

import ar.edu.unsam.PoiFinder.Model.DetallePoiAppModel
import grupo5.Banco
import grupo5.Cgp
import grupo5.Colectivo
import grupo5.Iop
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

abstract class DetallePoiWindow  extends Dialog<DetallePoiAppModel>
{
	new(WindowOwner parent, Iop poi)
	{
		super(parent, new DetallePoiAppModel(poi))
	}

	override protected addActions(Panel actionsPanel)
	{
		new Button(actionsPanel) =>
		[
		      caption = "Cerrar"
		      onClick[ | cerrar ]
		]
	}

	override protected createFormPanel(Panel mainPanel)
	{
		this.title = "Puntos de interes"

		val detPanel = new Panel(mainPanel)
		detPanel.layout =  new ColumnLayout(2)

		val a = new Panel(detPanel)
		a.layout =  new VerticalLayout
		
		new Label(a).bindImageToProperty("poi", new Transformer<Iop, Image>()
		{
			override transform(Iop poi)
			{
				if (poi instanceof Colectivo ) new Image("bus.png")
				else if (poi instanceof Cgp ) new  Image("cgp.png")
				else if (poi instanceof Banco) new Image("bank.png")
				else (new Image("local.png"))
			}
		}
		) 
		
		val b = new Panel(detPanel)
		b.layout =  new VerticalLayout
		
		new Label(b).text = modelObject.poi.nombre

		createChildPanel(detPanel)	
		
		val x = new Panel(mainPanel)
		x.layout =  new HorizontalLayout
		
		new Label(x).text = "      "     
		new Label(x).text = "                     Distancia"
		new Label(x).text = "  "
		new Label(x).text = "modelObject.distancia.intValue.toString"
		new Label(x).text = " km "
		
		val col = new Panel(mainPanel)
		col.layout =  new ColumnLayout(2)	
		val columnaIzq = new Panel(col)
		columnaIzq.layout =  new HorizontalLayout	
		new Label(columnaIzq).text = "        "
		new Label(columnaIzq).text = "Calificiación General: "					
		new Label(columnaIzq).text = "3,4"					//luego se bindea	
		
		new Label(columnaIzq).text = "            "
		
		val columnaDerecha = new Panel(col)
		columnaDerecha.layout =  new HorizontalLayout	
		new Label(columnaDerecha).text = "Favorito"		
		new CheckBox(columnaDerecha).value 					//<=> "estaAprobada"
		new Label(columnaDerecha).text = "            "
		
		this.layoutRedactarOpinion(mainPanel)
		
		this.layoutRedactarOpinionCorta(mainPanel)

		this.grillaResultados(mainPanel)
	}
	
	def void layoutRedactarOpinion(Panel panel)
	{
		val opPanel = new Panel(panel)
		opPanel.layout =  new ColumnLayout(2)
		
		this.crearOpinionIzq(opPanel)
		
		this.crearOpinionDer(opPanel)
	}

	def void crearOpinionIzq(Panel panel)
	{
		val opIzq = new Panel(panel)
		opIzq.layout =  new HorizontalLayout
		new Label(opIzq).text = "Tu opinión"
		new TextBox(opIzq) =>
		[
			height = 40				//Altura
			width = 170				//Obtiene o establece el ancho del control.
			multiLine = true

			//enabled
			//visible = false
			//multilineb.true
		     //onClick[ | cerrar  ]
		]
	}
	
	def void crearOpinionDer(Panel panel)
	{
		val columnaDerechaOpinion = new Panel(panel)
		columnaDerechaOpinion.layout =  new VerticalLayout	
		
		new Label(columnaDerechaOpinion).text = "     "
		
		new Spinner(columnaDerechaOpinion)=>
     	[
     		minimumValue = 1						//el valor mínimo que puede tomar
			maximumValue = 5 						//el valor máximo que puede tomar
			
			//enabled <=>"estasHabilitado"			//indica si está habilitado el control, se asocia a una propiedad que devuelve un boolean.
       	]

//		new Selector<NotaNumeriaOpinionModel>(columnaDerechaOpinion) =>
//     	[
//     		allowNull(false)
//     		
//     		value <=> "productoSeleccionado"
//     		
//    		 value <=> "notaSeleccionado"
//     		bindItems(new ObservableProperty(this.modelObject, "notas")).adapter  = new PropertyAdapter(typeof(NotaModel ), "bn")	  
//     	]  

     	new Button(columnaDerechaOpinion) =>
     	[
		      caption = "Enviar"
		      //onClick[ | cerrar  ]
		]
	}
	
	def void layoutRedactarOpinionCorta(Panel panel)
	{
		val o = new Panel(panel)
		o.layout =  new ColumnLayout(2)	
		val columnaIzqu = new Panel(o)
		columnaIzqu.layout =  new HorizontalLayout	
		new Label(columnaIzqu).text = "Opiniones: "		
					
		//new Label(columnaIzqu).text="Espacio para el Usr que se loguea ingrese su Opi"		//luego se bindea		
	}

	def void grillaResultados(Panel panel)
	{
		val gri = new Panel(panel)
		gri.layout =  new VerticalLayout	
		val gridPois = new Table(gri, typeof(Iop)) =>
		[
			height = 200
			numberVisibleRows = 6
			
//			bindItemsToProperty("poisEncontrados")
//			bindValueToProperty("poiSeleccionado")
			
			setNumberVisibleRows(5)
		]

		new Column<Iop>(gridPois) =>
		[
			fixedSize = 100
			title = "Usuario"
			bindContentsToProperty("search")
		]

		new Column<Iop>(gridPois) =>
		[
			fixedSize = 100
			title = "Comentario"
			bindContentsToProperty("direccion")
		]
		
		new Column<Iop>(gridPois) =>
		[
			fixedSize = 100
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

