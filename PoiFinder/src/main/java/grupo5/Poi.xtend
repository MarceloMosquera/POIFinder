package grupo5

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point
import java.util.Map

@Accessors
@Observable
abstract class Poi extends Entity
{
	String nombre
	String Barrio
	String direccion
	int numero
	Horario horarios
	Point coordenada
	double distanciaMinCercania
	List<String> diasAtencion = newArrayList
	List<String> palabrasClaves = new ArrayList
	List<Opinion> opiniones = newArrayList
	List<Usuario> UserLoveMe= newArrayList
	
	boolean estaCerca= false

	def estaAbierto(String nombre, String dia, int hora, int minuto)
	{
		(horarios.checkHora(hora, minuto) && diasAtencion.contains(dia))
	}
	def guardarOpinion(String texto,Usuario user,int puntaje){
		var op= new Opinion(texto,user,puntaje)
		opiniones.add(op)
	}
	def getOpiniones(){
		opiniones
	}
	def void estaCercaDe(Point point)
	{
		estaCerca=coordenada.distance(point) <= distanciaMinCercania
	}
	
	def double  distancia(Point point)
	{
		coordenada.distance(point)
	}
	
	def Boolean matcherXNombre(String _nombre)
	{
		this.nombre.toLowerCase.contains(_nombre.toLowerCase)
	}
	
	def String getPoints(){
		var float pun=0
     	//opiniones.forEach[n|pun=pun+n.puntaje]
     	if(opiniones.size!=0){
	     	for(var int i=0; i<opiniones.size;i++)
	     		pun+=opiniones.get(i).puntaje
	     	
	     	pun=pun/(opiniones.size)
	     }
	    if(pun%1!=0)
     	String.format("%.1f", pun)
     	else
     	String.format("%.0f", pun)
	}
}
