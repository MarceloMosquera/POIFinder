package ar.edu.unsam.PoiFinder.UI

import grupo5.Usuario
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.PasswordField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class LoginWindow extends SimpleWindow<LoginAppModel>{
	
	new(WindowOwner parent) {
		super(parent, new LoginAppModel )
	}
	
	
	override protected addActions(Panel actionsPanel) {
		var but = new Panel(actionsPanel)
		but.layout= new HorizontalLayout
			new Button(but) => [
			caption = "ok"			
			onClick([|validar])
		]
		new Button(but) => [
			caption = "Cancel"			
			onClick([|this.cancelar])
		]
	}
	
	def validar() {
		val res = modelObject.validar() 
		if (res) (new BusquedaWindow(this)).open
		else this.showError("Pusiste cualquier cosa")
	}
	def cancelar() {
		modelObject.userIngresado.username = ""
		modelObject.userIngresado.password = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Login"

		new Panel(mainPanel) => [
			
			new Label(it).text = "Usuario"
			new TextBox(it) => [
				value <=> "userIngresado.username"
				width = 200
			]
			new Label(it).text = "Password"
			
			new PasswordField(mainPanel).value <=> "userIngresado.password"

			]
		
	}
	
}