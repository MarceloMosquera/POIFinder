package ar.edu.unsam.PoiFinder.Model

import grupo5.BuilderIop
import grupo5.Repo
import grupo5.Usuario
import java.util.Arrays
import org.uqbar.arena.bootstrap.Bootstrap
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.geodds.Point
import grupo5.RepoUsuario

class PoiFinderBootstrap implements Bootstrap
{
	
	def void init() {}
	
	override isPending()
	{
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
		false
	}
	
	override run()
	{
		//val repo = ApplicationContext.instance.getSingleton(typeof(Repo)) as Repo
		var repo = new Repo
				
		val point1 = Point.and(18.787878, 34.567834)
		val point2 = Point.and(18.64558, 34.5667099)
		val point3 = Point.and(20.548967, 15.9898980)
		val point4 = Point.and(-34.546782, -58.552163)
	
		var listaPois = new BuilderIop()
			.crearBanco("Galicia", point1, "Belgrano", "Maximiliano", Arrays.asList("cobro cheques", "depósitos"), "Rivadavia 372")
			.crearBanco("Santander", point2, "Colegiales", "Roberto", Arrays.asList("cajero automatico"),"Lavalleja 581")
			.crearBanco("Banco Hipotecario", point1, "San Martin", "Mendez", Arrays.asList("cobro cheques", "depósitos", "cajero automatico"),"Cochabamba 2219")
			.crearColectivo(78, 10)
			.crearColectivo(11, 23)
			.crearColectivo(21, 11)
			.crearLocal("Lo de Rosa", Arrays.asList("Rabano", "Lechuga"), "Verduleria", point3,"Mitre 3271")
			.crearLocal("Lo de Carlos", Arrays.asList("Vacio", "Chinchulin", "Chorrizo", "Nalga"), "Carniceria", point4,"Matheu 3289")
			.crearLocal("Lo de Pepers", Arrays.asList("Chupetin", "Chicle", "Turron"), "Kiosco", point4,"Pueyrredon 3332")
			.crearCgp(10, point2, "Recoleta", "Gutierrez, Marcos", "Pres. José E. Uriburu 1022", " 4958-6504 / 7660-7047", Arrays.asList("Defensoría del Niño, Niña y Adolescente", "Registro Civil", "Oficina de Intermediacion Laboral", "Mediación Comunitaria"))
			.crearCgp(23, point4, "Flores", "Perez, Ramiro", "Esmeralda 4459", " 4235-8954 / 7658-7147", Arrays.asList("Casamientos", "Atención ciudadana"))
			.build

		repo.create(listaPois)
		
		val user1= new Usuario("Dodino","dodain","algo")
		val user2= new Usuario("Pepe","PP","PP")
		val user3= new Usuario("Sarasa","lo9s","1234")
		val user4= new Usuario("Aangus","Angus","qwert")
		var repoUser= new RepoUsuario()
		repoUser.create(user1)
		repoUser.create(user2)
		repoUser.create(user3)
		repoUser.create(user4)
		ApplicationContext.instance.configureSingleton(typeof(Repo), repo)
		ApplicationContext.instance.configureSingleton(typeof(RepoUsuario), repoUser)	
	}	
}
