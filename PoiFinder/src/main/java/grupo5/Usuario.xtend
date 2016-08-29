package grupo5

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList
import org.uqbar.geodds.Point

@Accessors
@Observable
class Usuario extends Entity{
	
	String nombre
	Busqueda busqueda 
	Administrador admin
	String username
	String password
	List<Integer> busquedasRealizadas =new ArrayList
	List<Poi> favoritos =new ArrayList
	Point gpsCoor
	
	
	new (String name, String user, String pass){
		nombre= name
		username= user
		password= pass
	}
	
	new(Repo rep, String name) {
		busqueda = new Busqueda(rep, this)
		nombre=name
	}
	
	
	def buscar(String algo){
		busqueda.buscar(algo)
		
	}
	
	def borrarObservers(List<ObserverBusqueda> observer){
		observer.forEach[ob|busqueda.removeObserver(ob)]
	}
	
	def String showNombre(){
		nombre
	}
	
	def addObserver(ObserverBusqueda obs){
		busqueda.addObserver(obs)
	}
	def removeObserver(ObserverBusqueda obs){
		busqueda.removeObserver(obs)
	}
	
	def nuevaBusqueda(int i) {
		busquedasRealizadas.add(i)
	}
	
	
}
