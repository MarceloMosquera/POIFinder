package ar.edu.unsam.PoiFinder.UI

import grupo5.Repo
import org.uqbar.commons.utils.ApplicationContext

class BaseAppModel {
	
	def Repo getRepo() {
		ApplicationContext.instance.getSingleton(typeof(Repo))
	}
	
	//prueba jahesa
}