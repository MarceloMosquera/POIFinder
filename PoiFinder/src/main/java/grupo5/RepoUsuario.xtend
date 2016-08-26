package grupo5

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class RepoUsuario extends CollectionBasedRepo<Usuario> {

	def  validarLogin(Usuario user) {
		allInstances.findFirst(usu|usu.username == user.username && usu.password==user.password)
	}
	
	def existeUsuario(String unUser) {
		allInstances.exists[user | user.username.equalsIgnoreCase(unUser)]
	}
	
	def validacionDePass(String nombre, String pass) {
		allInstances.exists[user | user.username==nombre && user.password==pass]
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
