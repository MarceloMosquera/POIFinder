package ar.edu.unsam.PoiFinder.UI

import grupo5.Repo
import org.uqbar.arena.Application
import org.uqbar.commons.utils.ApplicationContext

class PoiFinderApplication extends Application  {
	
	new(PoiFinderBootstrap bootstrap) {
		super(bootstrap)
	}
	
	static def void main(String[] args) {
		new PoiFinderApplication(new PoiFinderBootstrap).start()
	}
	
	override protected createMainWindow() {
		//return new LoginWindow(this)
		return new BusquedaWindow(this)
	}
	
	
}