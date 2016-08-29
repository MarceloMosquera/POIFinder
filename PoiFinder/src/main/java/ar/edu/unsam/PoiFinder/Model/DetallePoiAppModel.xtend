package ar.edu.unsam.PoiFinder.Model

import grupo5.Opinion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import grupo5.Poi

@Observable
@Accessors
class DetallePoiAppModel extends BaseAppModel {
	Poi poi
	int puntaje
	double distancia
	String comentarioUser
	List<Opinion> opinionesDelPoi
	Boolean estaAprobada

	new(Poi poi) {
		this.poi = poi
		distancia = poi.distancia(getUsuarioLogueado.gpsCoor)
		opinionesDelPoi=poi.getOpiniones()
		estaAprobada=usuarioLogueado.estaFavorito(poi)
	}

	// Para hablilitar o deahabilitar un control, de ser necesario
	boolean estasHabilitado

	def boolean getEstasHabilitado() {
		true
	}

	def enviarComentario() {
		poi.guardarOpinion(comentarioUser, getUsuarioLogueado, puntaje)
		comentarioUser = " "
		opinionesDelPoi = poi.getOpiniones()
		if(estaAprobada){
			usuarioLogueado.agregarFavorito(poi)
		}else{if(usuarioLogueado.estaFavorito(poi)){
			usuarioLogueado.sacarFavorito(poi)
		}}
	// Si se define opiniones aca, aparece		
	}

}
