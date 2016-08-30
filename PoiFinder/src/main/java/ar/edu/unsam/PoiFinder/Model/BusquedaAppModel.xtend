package ar.edu.unsam.PoiFinder.Model

import grupo5.Poi
import grupo5.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point
import grupo5.DispositivoGps

@Observable
@Accessors
class BusquedaAppModel extends BaseAppModel {

	String nombreDePoiABuscar
	List<PoiBusquedaModel> poisEncontrados
	PoiBusquedaModel poiSeleccionado
	Boolean favoritos
	
	new(){
		search()
	}

	def search() {
		poisEncontrados = new ArrayList<PoiBusquedaModel>
		val pois = repo.searchFor(nombreDePoiABuscar)
		pois.forEach[ p | 
			poisEncontrados.add( new PoiBusquedaModel(p, usuarioLogueado,gps))
		]
		ObservableUtils.firePropertyChanged(this, "poisEncontrados", getPoisEncontrados())
	}

	@Dependencies("poiSeleccionado")
	def boolean getHayPoiSeleccionado() {
		poiSeleccionado != null
	}

}

@Observable
@Accessors
class PoiBusquedaModel {
	Poi poi
	boolean estaCerca= false
	boolean favorito= false
	
	new (Poi _poi, Usuario user,DispositivoGps gps) {
		this.poi = _poi
		this.estaCerca = estaCercaDe(gps.coordenadas)
		this.favorito = user.esFavorito(_poi)
	}
	
	def boolean estaCercaDe(Point point)
	{
		poi.estaCercaDe(point)
		poi.estaCerca
	}
	
}
