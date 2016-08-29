package grupo5

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Busqueda {

	List<ObserverBusqueda> observer = new ArrayList
	String nombre
	List<Poi> results = new ArrayList
	Usuario usuario
	Repo repo
	long time

	new(Repo rep, Usuario user) {
		repo = rep
		usuario = user
	}

	def buscar(String algo) {
		var long start = System.currentTimeMillis();
		results = repo.searchFor(algo)
		time = System.currentTimeMillis() - start;
		nombre = algo
		notifyObservers()
		results.clear
	}

	def addObserver(ObserverBusqueda obs) {
		observer.add(obs)
	}

	def removeObserver(ObserverBusqueda obs) {
		observer.remove(obs)
	}

	def notifyObservers() {
		observer.forEach[obs|obs.update(this)]
	}
}
