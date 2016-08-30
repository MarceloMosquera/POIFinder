package ar.edu.unsam.PoiFinder.Model

import grupo5.RepoUsuario
import grupo5.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class LoginAppModel {

	String unNombre
	String unPass
	Usuario unUsuarioLogueado

 	def RepoUsuario getRepoUser() {
		ApplicationContext.instance.getSingleton(typeof(RepoUsuario))
	}

	def setUsuarioLogueado(Usuario userLogueado) {
		ApplicationContext.instance.configureSingleton(typeof(Usuario), userLogueado)
	}

	def Usuario getUsuarioLogueado() {
		ApplicationContext.instance.getSingleton(typeof(Usuario))
	}

	def limpiar() {
		unNombre = ""
		unPass = ""
	}

	def validarLogin() {
		if (!repoUser.existeUsuario(unNombre)) {
			throw new UserException("No existe el usuario indicado")
		} else {
			if (repoUser.validacionDePass(unNombre, unPass)) {
				unUsuarioLogueado = repoUser.buscarUsuario(unNombre, unPass)
				setUsuarioLogueado(unUsuarioLogueado)
			} else {
				throw new UserException("Password incorrecta")
			}
		}
	}

}
