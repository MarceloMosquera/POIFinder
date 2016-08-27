package ar.edu.unsam.PoiFinder.Model

import grupo5.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class LoginAppModel extends BaseAppModel {

	String unNombre
	String unPass
	Usuario unUsuarioLogueado
	Usuario unUserSinLoguear

	def limpiar() {
		unNombre = ""
		unPass = ""

	}

	def validarLogin() {
		if (!repoUser.existeUsuario(unNombre)) {
			throw new UserException("No existe el usuario indicado")
		} else {
			unUserSinLoguear = new Usuario("","","")
			unUserSinLoguear.username = unNombre
			unUserSinLoguear.password = unPass
			
			unUsuarioLogueado = repoUser.validarLogin(unUserSinLoguear)
			user=unUsuarioLogueado
			
			if (!repoUser.validacionDePass(unNombre, unPass)) {
			throw new UserException("Password incorrecta")
		}
		}
	}

}
