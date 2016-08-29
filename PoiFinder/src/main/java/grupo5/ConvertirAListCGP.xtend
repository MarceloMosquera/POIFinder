package grupo5

import java.util.List
import java.util.ArrayList
import org.uqbar.geodds.interfacesExternas.CentroDTO
//import org.uqbar.geodds.interfacesExternas.ServicioDTO
import org.uqbar.geodds.Point

class ConvertirAListCGP {
	List<Poi> listacgp=new ArrayList<Poi>
	int numComuna
	double X
	double Y
	String zonas
	String director
	String direccion
	String tel
	List<String> servicios=new ArrayList<String>
	
	def convertToCGPList(List<CentroDTO> centros){
		
		centros.forEach[c|numComuna=c.numeroComuna
			X=c.coordenadaX
			Y=c.coordenadaY
			zonas=c.zonasIcluidas
			director=c.nombreDirector
			direccion=c.domicilio
			tel=c.telefono
			c.serviciosDTO.forEach[serv|servicios.add(serv.nombreServicio)]
			listacgp.add(new Cgp(numComuna,Point.and(X,Y),zonas,director,direccion,tel,servicios))
			
		]
	
	}
	
	def getlista(){
		listacgp
	}
	
	def int getsizeListaconvert(){
		listacgp.size
	}
	
	def boolean estaEnBArrio(String name){
		listacgp.exists(l|l.barrio.startsWith(name))
	}
	
	def boolean estaDomicilio(String name){
		listacgp.exists(l|l.direccion.startsWith(name))
	}
}