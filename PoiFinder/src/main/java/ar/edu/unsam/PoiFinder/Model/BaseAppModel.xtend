package ar.edu.unsam.PoiFinder.Model

import grupo5.Repo
import org.uqbar.commons.utils.ApplicationContext
import grupo5.RepoUsuario

class BaseAppModel {
	
	def Repo getRepo() {
		ApplicationContext.instance.getSingleton(typeof(Repo))
	}
	
	def RepoUsuario getRepoUser() {
		ApplicationContext.instance.getSingleton(typeof(RepoUsuario))
	}
}