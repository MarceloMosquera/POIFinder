package grupo5

import com.eclipsesource.json.Json
import com.eclipsesource.json.JsonObject
import com.eclipsesource.json.JsonArray
import java.util.List
import java.util.ArrayList
import org.uqbar.geodds.Point
import com.eclipsesource.json.JsonValue

class ConvertidorJsonToObject{

	List<Poi> listaBancos = new ArrayList<Poi>
	
	

	def readJson(String algo){
		var JsonArray bancos = new JsonArray
		 bancos = Json.parse(algo).asObject().get("").asArray()
		 
		for (JsonValue bank : bancos) {
			var List<String> servicio = new ArrayList
		 	 var String name = bank.asObject().getString("name", "Unknown Item")
		 	 var int x = bank.asObject().getInt("x", 1)
		 	 var int y = bank.asObject().getInt("y", 1)
		 	 var String sucursal = bank.asObject().getString("Sucursal", "Unknown Item")
		 	 var String gerente = bank.asObject().getString("Gerente", "Unknown Item")
		 	 var String direccion = bank.asObject().getString("Direccion", "Unknown Item")
		 	 var JsonArray servicios = bank.asObject().get("Servicios").asArray()
				  for (var int i=0; i<servicios.size(); i++) {
		    		servicio.add( servicios.get(i).toString );
					}
		   
		  listaBancos.add(new Banco(name,Point.and(x,y),sucursal,gerente,servicio,direccion))
			}
	}

	def getLista(){
		listaBancos
		}
	def getListaSize(){
		listaBancos.size
		}
	def getBancoNombre(int lugar){
		listaBancos.get(lugar).getNombre
		}	
	def getBancoSucursal(int lugar){
		listaBancos.get(lugar).getBarrio
		}
	
	
}