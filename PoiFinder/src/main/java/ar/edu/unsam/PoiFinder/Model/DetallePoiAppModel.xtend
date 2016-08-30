package ar.edu.unsam.PoiFinder.Model

import grupo5.Opinion
import grupo5.Poi
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DetallePoiAppModel extends BaseAppModel {
	Poi poi
	int puntaje
	double distancia
	String comentarioUser
	List<Opinion> opinionesDelPoi

	new(Poi poi) {
		this.poi = poi
		distancia = poi.distancia(getUsuarioLogueado.gpsCoor)
		opinionesDelPoi = poi.getOpiniones()
	}


	def enviarComentario() {
		if (poi.opiniones.exists(n|n.getUser() == usuarioLogueado)) {
			throw new UserException("No se permite opinar mas de una vez")
		} else {
			poi.guardarOpinion(comentarioUser, getUsuarioLogueado, puntaje)
			comentarioUser = ""
			opinionesDelPoi = poi.getOpiniones()
			ObservableUtils.firePropertyChanged(this, "opinionesDelPoi", getOpinionesDelPoi())
		}
	}

	def boolean getEsFavorito() {
		usuarioLogueado.esFavorito(poi)
	}

	def void setEsFavorito(boolean value) {
		if(value) {
			usuarioLogueado.agregarAFavoritos(poi) 
		} else {
			usuarioLogueado.sacarDeFavoritos(poi)
		}
		ObservableUtils.firePropertyChanged(this, "esFavorito", getEsFavorito())
	}
}
