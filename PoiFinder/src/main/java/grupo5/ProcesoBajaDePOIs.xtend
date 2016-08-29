package grupo5

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.Date

@Accessors
class ProcesoBajaDePOIs extends Proceso {

	Repo repo
	String nombreBuscado
	Date fecha
	RestService service = new RestService

	new(Repo _repo) {
		repo = _repo
	}

	def boolean darDeBaja(String nombrePoi) {
		nombreBuscado = nombrePoi
		fecha = new Date
		eliminarPoiDelRepositorio(nombrePoi)

	}

	def eliminarPoiDelRepositorio(String nombrePoi) {
		if (repo.searchByName(nombrePoi)) {
			var List<Poi> dadosDeBaja = repo.searchFor(nombrePoi)
			dadosDeBaja.forEach[poi|repo.delete(poi)]
			service.devolverJson(this)
			this.fin = new Date
			return true
		} else {
			System.out.println(nombrePoi + " no se ha encontrado")
			return false
		}
	}

	override ejecutarProceso(String string, ObserverBusqueda ob) {
		this.darDeBaja(string)
	}

	override hacer(String nombrePoi) {
		this.init = new Date
		this.darDeBaja(nombrePoi)
	}

}
