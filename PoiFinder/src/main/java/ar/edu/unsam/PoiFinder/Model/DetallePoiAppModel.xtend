package ar.edu.unsam.PoiFinder.Model

import grupo5.Opinion
import grupo5.Poi
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
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
		distancia = poi.distancia(usuarioLogueado.gpsCoor)
		opinionesDelPoi = poi.getOpiniones()
		cargarComentario
	}

	def cargarComentario () {
		val opinion = poi.getMiOpinion(usuarioLogueado)
		if (opinion != null){
			comentarioUser = opinion.coment
			puntaje = opinion.puntaje
		}
		else {
			puntaje = 1
		}
	}

	def enviarComentario() {
		poi.guardarOpinion(comentarioUser, getUsuarioLogueado, puntaje)
		opinionesDelPoi = poi.getOpiniones()
		ObservableUtils.firePropertyChanged(this, "opinionesDelPoi", getOpinionesDelPoi())
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
