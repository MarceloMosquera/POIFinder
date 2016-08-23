package grupo5

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Repo extends CollectionBasedRepo<Iop> {

	def boolean searchByName(String nombre) {
		allInstances.exists(list|list.matcherXNombre(nombre))
	}
		
	List<Iop> iopsResult = new ArrayList
	def List<Iop> searchFor(String nombre) {
		iopsResult.clear
		allInstances.forEach(list|if(nombre==""||nombre==null||list.matcherXNombre(nombre)) iopsResult.add(list))
		iopsResult
	}

	override void update(Iop object) {
		if (this.objects.remove(object)) {
			this.objects.add(object)
		} else {
			throw new RuntimeException("No se encontró el objeto a actualizar")
		}
	}
	
	def create(List<Iop> iop) {
		iop.forEach[n|this.create(n)]
	}

	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override protected getCriterio(Iop example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
