package grupo5

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class RepoUsuario extends CollectionBasedRepo<Usuario> {

	def boolean validarLogin(Usuario user) {
		allInstances.exists(usu|usu.nombre == user.username && usu.password==user.password)
	}

	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override protected getCriterio(Usuario example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
