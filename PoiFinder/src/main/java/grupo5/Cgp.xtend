package grupo5

import java.util.List
import java.util.ArrayList
import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Cgp extends Iop {
	Comuna comuna
	List<Servicio> servicios
	String director
	String telefono
	List<String> servicio = new ArrayList<String>

	new(Comuna comu) {
		comuna = comu
		servicios = new ArrayList
	}
	new(int _numero,Point _coordenada,String barrios,String _director,String calle,String _telefono,List<String> _servicio){
		nombre = "CGP "+_numero
		numero=_numero
		coordenada=_coordenada
		barrio=barrios
		director=_director
		direccion=calle
		telefono=_telefono
		servicio = _servicio
	}

	def void addServicio(Servicio servicio) {
		servicios.add(servicio)
	}

	override boolean estaAbierto(String nombre, String dia, int hora, int minuto) {
		servicios.exists(service|service.existeNombreIgual(nombre) && service.validarFecha(dia, hora, minuto))
	}

	def boolean estaAbierto(String dia, int hora, int minuto) {
		servicios.exists(service|service.validarFecha(dia, hora, minuto))
	}

	def boolean estaServicio(String nombre) {
		servicios.exists(servicio|servicio.getNombre.startsWith(nombre))
	}

	def numComuna() {
		comuna.getNombre()
	}

	
	override estaCercaDe(Point point) {
		comuna.validarPosicion(point)
	}
	
	override Boolean matcherXNombre(String nombre){
		direccion.startsWith(nombre)||barrio.startsWith(nombre)
	}

}
