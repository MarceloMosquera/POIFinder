package grupo5

import java.util.List
import java.util.ArrayList
import java.util.Date

class ProcesoActualizacionLocalesComerciales extends Proceso
{
	List<Poi> locales = new ArrayList
	TxtReader reader = new TxtReader
	
	
new (Repo repo){
	
	repo.allInstances.forEach[a|if(a.class==typeof(Local)){locales.add(a)}]
}

new(){}	

	override  hacer(String _busqueda){
		this.init =new Date
		var String [] temp
		var Poi tempLocal = locales.findFirst[local|local.nombre.equals(_busqueda)]
			if(tempLocal!=null){			
					temp= reader.read(_busqueda)					
					return this.changeKeyWord(temp,tempLocal)						
			}else{
				return	false			
			}
		
		
	}


	def changeKeyWord(String[] text,Poi tempLocal){
		if(text.length!=0){
				for(var i=0;i<text.length;i++){
					tempLocal.palabrasClaves.add(text.get(i))
					}
				this.fin = new Date
				return true
		}else{
			return false
		} 
	}
	
	

	def localesSet(Local list){
		locales.add(list)
	}
	def getList(){
		locales
	}
	
	override ejecutarProceso(String string, ObserverBusqueda ob)
	{
		hacer(string)
	}
	
}
