package grupo5

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Repo extends CollectionBasedRepo<Poi> {

	def boolean searchByName(String nombre) {
		allInstances.exists(list|list.matcherXNombre(nombre))
	}
		
	List<Poi> poisResult = new ArrayList
	def List<Poi> searchFor(String nombre) {
		poisResult.clear
		allInstances.forEach(list|if(nombre==""||nombre==null||list.matcherXNombre(nombre)) poisResult.add(list))
		poisResult
	}

	override void update(Poi object) {
		if (this.objects.remove(object)) {
			this.objects.add(object)
		} else {
			throw new RuntimeException("No se encontró el objeto a actualizar")
		}
	}
	
	def create(List<Poi> iop) {
		iop.forEach[n|this.create(n)]
	}

	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override protected getCriterio(Poi example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
