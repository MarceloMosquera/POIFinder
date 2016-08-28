package ar.edu.unsam.PoiFinder.UI

import org.uqbar.arena.Application
import ar.edu.unsam.PoiFinder.Model.PoiFinderBootstrap

class PoiFinderApplication extends Application {

	new(PoiFinderBootstrap bootstrap) {
		super(bootstrap)
	}

	static def void main(String[] args) {
		new PoiFinderApplication(new PoiFinderBootstrap).start()
	}

	override protected createMainWindow() {
		return new LoginWindow(this)
	}

}
