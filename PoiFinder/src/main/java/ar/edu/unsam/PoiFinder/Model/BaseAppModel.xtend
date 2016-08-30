package ar.edu.unsam.PoiFinder.Model

import grupo5.Repo
import org.uqbar.commons.utils.ApplicationContext
import grupo5.RepoUsuario
import grupo5.Usuario
import grupo5.DispositivoGps

class BaseAppModel {

	def Repo getRepo() {
		ApplicationContext.instance.getSingleton(typeof(Repo))
	}

	def RepoUsuario getRepoUser() {
		ApplicationContext.instance.getSingleton(typeof(RepoUsuario))
	}

	def Usuario getUsuarioLogueado() {
		ApplicationContext.instance.getSingleton(typeof(Usuario))
	}

	def DispositivoGps getGps() {
		ApplicationContext.instance.getSingleton(typeof(DispositivoGps))
	}
}
