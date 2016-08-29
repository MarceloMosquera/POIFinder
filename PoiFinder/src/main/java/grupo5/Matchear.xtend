package grupo5

import java.util.List
import java.util.ArrayList

class Matchear {
	List<Poi> listaPois=new ArrayList<Poi>
	
	def void agregarPoi(Poi poi){
		listaPois.add(poi)
	}
	
	def boolean matchearPoi(String name){
		listaPois.exists(lp|lp.matcherXNombre(name))
	}
}