package ar.edu.unsam.PoiFinder.UI

import grupo5.Iop
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class BusquedaAppModel extends BaseAppModel {
	
	String nombreDePoiABuscar
	List<Iop> poisEncontrados 
	Iop poiSeleccionado	
	
	def search(){
		poisEncontrados = new ArrayList<Iop>
		poisEncontrados=repo.searchFor(nombreDePoiABuscar)
	}
	
	@Dependencies("poiSeleccionado")
	def boolean getHayPoiSeleccionado()
	{
		poiSeleccionado != null
	}

}
