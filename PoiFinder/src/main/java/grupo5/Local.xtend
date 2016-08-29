package grupo5

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Local extends Poi {
	var String categoria
	String direccion
	List<String> palabrasClaves = new ArrayList

	new(Point coordenadas, double minimaDistancia) {
		coordenada = coordenadas
		distanciaMinCercania = minimaDistancia
	}
	new(String _nombre) {
		nombre = _nombre
	}
	new(String _nombre,List<String> claves,String _categoria,Point coordenadas, String dir){
		nombre=_nombre
		palabrasClaves=claves
		categoria=_categoria
		direccion=dir
		coordenada=coordenadas
	}
	
		def adddia(String dia) {
		diasAtencion.add(dia)
	}

	//override estaCercaDe(Point point) {
	//	coordenada.distance(point) <= distanciaMinCercania
	//}

	def void sethorarios(int horaap, int minap, int horacierr, int mincierr) {
		horarios = new Horario(horaap, minap, horacierr, mincierr)
	}

	def void sethorarios(int horaapMañana, int minapMañana, int horacierrMañana, int mincierrMañana, int horaapTarde,
		int minapTarde, int horacierrTarde, int mincierrTarde) {
		horarios = new Horario(horaapMañana, minapMañana, horacierrMañana, mincierrMañana, horaapTarde, minapTarde,
			horacierrTarde, mincierrTarde)
	}

	override estaAbierto(String nombre, String dia, int hora, int minuto) {
		(horarios.checkHora(hora, minuto) && diasAtencion.contains(dia))
	}

	def agregarClave(String clave) {
		palabrasClaves.add(clave)
	}
	
	def getKey(){palabrasClaves}
	def clear(){palabrasClaves.clear}
	
	override Boolean matcherXNombre(String _nombre){
		palabrasClaves.contains(_nombre)|| categoria.toLowerCase == _nombre.toLowerCase || this.nombre.toLowerCase.startsWith(_nombre.toLowerCase)
	}
}
