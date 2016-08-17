package grupo5

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Servicio {

	var String nombre
	List<String> diasAtencion = newArrayList
	Horario horarios

	def void sethorarios(int horaap, int minap, int horacierr, int mincierr) {
		horarios = new Horario(horaap, minap, horacierr, mincierr)
	}

	def void sethorarios(int horaapMañana, int minapMañana, int horacierrMañana, int mincierrMañana, int horaapTarde,
		int minapTarde, int horacierrTarde, int mincierrTarde) {
		horarios = new Horario(horaapMañana, minapMañana, horacierrMañana, mincierrMañana, horaapTarde, minapTarde,
			horacierrTarde, mincierrTarde)
	}

	def String setNombre(String texto) {
		nombre = texto
	}

	def adddia(String dia) {
		diasAtencion.add(dia)
	}

	def existeNombreIgual(String texto) {
		nombre.matches(texto)
	}

	def validarFecha(String dia, int hora, int minuto) {
		(horarios.checkHora(hora, minuto) && diasAtencion.contains(dia))
	}

}
