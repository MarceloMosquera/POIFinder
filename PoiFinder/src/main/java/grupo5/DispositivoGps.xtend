package grupo5

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class DispositivoGps {
	Point coordenadas
	new(Point point){
		coordenadas=point
	}
}