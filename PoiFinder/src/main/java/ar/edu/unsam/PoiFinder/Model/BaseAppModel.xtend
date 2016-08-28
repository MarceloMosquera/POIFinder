package ar.edu.unsam.PoiFinder.Model

import grupo5.Repo
import org.uqbar.commons.utils.ApplicationContext
import grupo5.RepoUsuario
import grupo5.Usuario

class BaseAppModel {

	def Repo getRepo() {
		ApplicationContext.instance.getSingleton(typeof(Repo))
	}

	def RepoUsuario getRepoUser() {
		ApplicationContext.instance.getSingleton(typeof(RepoUsuario))
	}

	def setUsuarioLoguedo(Usuario userLogueago) {
		ApplicationContext.instance.configureSingleton(typeof(Usuario), userLogueago)
	}

	def Usuario getUsuarioLoguedo() {
		ApplicationContext.instance.getSingleton(typeof(Usuario))
	}
}
