package grupo5

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import org.uqbar.commons.utils.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Banco extends Poi {

	List<String> diasAtencion = newArrayList("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")
	double distanciaMinCercania = 0.5
	String gerente
	String direccion
	List<String> servicio = new ArrayList<String>

	new() {
		horarios = new Horario(10, 00, 15, 00)
	}

	new(String _nombre, Point _coordenada, String sucursal, String _gerente, List<String> _servicio, String dir) {
		nombre = _nombre
		coordenada = _coordenada
		barrio = sucursal
		gerente = _gerente
		servicio = _servicio
		direccion = dir
		horarios = new Horario(10, 00, 15, 00)
	}

	new(String _nombre) {
		nombre = _nombre
	}

	new(Point punto) {
		coordenada = punto
	}

	def agregarServicio(String unServicio) {
		servicio.add(unServicio)
	}

	def adddia(String dia) {
		diasAtencion.add(dia)
	}

	override estaAbierto(String nombre, String dia, int hora, int minuto) {
		(horarios.checkHora(hora, minuto) && diasAtencion.contains(dia))
	}


	def getnombre() {
		nombre
	}

}
