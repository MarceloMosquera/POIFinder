package grupo5

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import org.uqbar.commons.utils.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Opinion
{
	String coment
	Usuario user
	int puntaje=0			

	new(String com, Usuario usr, int score)
	{
		coment=com
		user=usr
		puntaje=score
	}



		
}
