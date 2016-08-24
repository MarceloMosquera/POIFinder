package ar.edu.unsam.PoiFinder.Model

import grupo5.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unsam.PoiFinder.Model.BaseAppModel

@Observable
@Accessors
class LoginAppModel extends BaseAppModel
{
	Usuario userIngresado
	
	new()
	{
		userIngresado = new Usuario("","","")
	}
	
	def  boolean validar(){
		repoUser.validarLogin(userIngresado)
	}
	
	
	
}
