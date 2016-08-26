package ar.edu.unsam.PoiFinder.UI

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.PasswordField
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unsam.PoiFinder.Model.LoginAppModel

class LoginWindow extends SimpleWindow<LoginAppModel> {

	new(WindowOwner parent) {
		super(parent, new LoginAppModel)
		title = "Login"
		taskDescription = "Bienvenido"
	}

	override protected addActions(Panel actionsPanel) {
		var but = new Panel(actionsPanel)
		but.layout = new HorizontalLayout

		new Button(but) => [
			caption = "OK"
			onClick[|
				modelObject.validarLogin
				this.close
				new BusquedaWindow(this, modelObject.unUsuarioLogueado).open
			]
			width = 100
			disableOnError
			setAsDefault

		]

		new Button(but) => [
			caption = "Cancelar"
			onClick[|modelObject.limpiar]
			width = 100
		]
	}


	override protected createFormPanel(Panel mainPanel) {
		
		new Panel(mainPanel) => [
			new Label(it).text = "Usuario"

			new TextBox(it) => [
				value <=> "unNombre"
				width = 200
			]

			new Label(it).text = "Password"
			new PasswordField(mainPanel).value <=> "unPass"
		]
	}

}
