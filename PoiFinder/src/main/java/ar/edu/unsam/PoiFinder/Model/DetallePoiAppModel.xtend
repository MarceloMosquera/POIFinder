package ar.edu.unsam.PoiFinder.Model

import grupo5.Iop
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import grupo5.Usuario
import java.util.List
import grupo5.Opinion

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
		distancia = poi.distancia(usuarioLoguedo.gpsCoor)
//		opinionesDelPoi=poi.getOpiniones()     Si se desvincula aca, no muestra un pomo.
	}

	// Para hablilitar o deahabilitar un control, de ser necesario
	boolean estasHabilitado

	def boolean getEstasHabilitado() {
		true
	}

	def enviarComentario() {
		poi.guardarOpinion(comentarioUser, usuarioLoguedo, puntaje)
		comentarioUser = ""
		opinionesDelPoi = poi.getOpiniones()
	// Si se define opiniones aca, aparece		
	}

}
