package grupo5

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Horario {
	int horaAperturaMañana
	int horaAperturaTarde = 0
	int minutoAperturaMañana
	int minutoAperturaTarde = 0
	int horaCierreMañana
	int horaCierreTarde = 0
	int minutoCierreMañana
	int minutoCierreTarde = 0

	new(int abreHoraMañana, int abreMinMañana, int cierraHoraMañana, int cierraMinMañana, int abreHoraTarde,
		int abreMinTarde, int cierraHoraTarde, int cierraMinTarde) {
		horaAperturaMañana = abreHoraMañana
		minutoAperturaMañana = abreMinMañana
		horaCierreMañana = cierraHoraMañana
		minutoCierreMañana = cierraMinMañana
		horaAperturaTarde = abreHoraTarde
		minutoAperturaTarde = abreMinTarde
		horaCierreTarde = cierraHoraTarde
		minutoCierreTarde = cierraMinTarde
	}

	new(int abreHoraMañana, int abreMinMañana, int cierraHoraMañana, int cierraMinMañana) {
		horaAperturaMañana = abreHoraMañana
		minutoAperturaMañana = abreMinMañana
		horaCierreMañana = cierraHoraMañana
		minutoCierreMañana = cierraMinMañana
	}

	def checkHora(int hora, int minuto) {
		entreHora(hora, minuto, horaAperturaMañana, minutoAperturaMañana, horaCierreMañana, minutoCierreMañana) ||
			entreHora(hora, minuto, horaAperturaTarde, minutoAperturaTarde, horaCierreTarde, minutoCierreTarde)
	}

	def entreHora(int horaUsuario, int minutoUsuario, int horaAperturaDato, int minutoAperturaDato, int horaCierreDato,
		int minutoCierreDato) {
		if (horaUsuario > horaAperturaDato && horaUsuario < horaCierreDato) {
			return true
		} else {
			(horaUsuario == horaCierreDato && minutoUsuario <= minutoCierreDato) ||
				(horaUsuario == horaAperturaDato && minutoUsuario >= minutoAperturaDato)
		}
	}
}
