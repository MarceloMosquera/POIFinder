package ar.edu.unsam.PoiFinder.Model

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable
import grupo5.Poi

@Observable
@Accessors
class BusquedaAppModel extends BaseAppModel {

	String nombreDePoiABuscar
	List<Poi> poisEncontrados
	Poi poiSeleccionado

	def search() {
		poisEncontrados = new ArrayList<Poi>
		poisEncontrados = repo.searchFor(nombreDePoiABuscar)
		poisEncontrados.forEach[n|n.estaCercaDe(getUsuarioLogueado.gpsCoor)]
	}

	@Dependencies("poiSeleccionado")
	def boolean getHayPoiSeleccionado() {
		poiSeleccionado != null
	}

}
