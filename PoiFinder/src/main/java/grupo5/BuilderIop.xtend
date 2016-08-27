package grupo5

import java.util.ArrayList
import java.util.List
import org.uqbar.geodds.Point

class BuilderIop 
{
	List<Iop> lista = new ArrayList<Iop>
	
	//Representa el objeto complejo a construir.
	//Colectivo c
	
	def crearBanco(String _nombre, Point _coordenada,String sucursal,String _gerente,List<String> _servicio, String dir)
	{
		var Banco ban = new Banco(_nombre, _coordenada,sucursal,_gerente, _servicio, dir)
		lista.add(ban)
		this
	}
	
	def crearColectivo(int nombre, int cp)
	{
		var Colectivo colec = new Colectivo(nombre, cp)
		lista.add(colec)
		
		this
	}
	
	//def Local((Point coordenadas, double minimaDistancia,String _nombre)
	def crearLocal(String _nombre,List<String> claves,String categoria,Point coordenadas,String dir)
	{
		
		var Local local = new Local(_nombre)
		local.categoria=categoria
		local.direccion=dir
		local.coordenada=coordenadas
		local.palabrasClaves=claves
		lista.add(local)
		this
	}
	
	def crearCgp(int _numero,Point _coordenada,String barrios,String _director,String calle,String _telefono,List<String> _servicio)
	{
		var Cgp cg = new Cgp(_numero, _coordenada, barrios, _director, calle, _telefono, _servicio)
		lista.add(cg)
		this
	}
	
	def build()
	{
		lista
	}	
}