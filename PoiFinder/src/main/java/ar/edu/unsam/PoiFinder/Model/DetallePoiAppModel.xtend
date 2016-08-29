package ar.edu.unsam.PoiFinder.Model

import grupo5.Iop
import grupo5.Opinion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DetallePoiAppModel extends BaseAppModel {
	Iop poi
	int puntaje
	double distancia
	String comentarioUser
	List<Opinion> opinionesDelPoi

	new(Iop poi) {
		this.poi = poi
		distancia = poi.distancia(getUsuarioLogueado.gpsCoor)
//		opinionesDelPoi=poi.getOpiniones()     Si se desvincula aca, no muestra un pomo.
	}

	// Para hablilitar o deahabilitar un control, de ser necesario
	boolean estasHabilitado

	def boolean getEstasHabilitado() {
		true
	}

	def enviarComentario() {
		poi.guardarOpinion(comentarioUser, getUsuarioLogueado, puntaje)
		comentarioUser = ""
		opinionesDelPoi = poi.getOpiniones()
	// Si se define opiniones aca, aparece		
	}

}
