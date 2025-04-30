object paquete {
  var destino = puente
  const pagado = true
  //method puedeSerEntregado(mensajero) = self.estaPago() and mensajero.puedeLlegar(destino)
  method puedeSerEntregado(mensajero) = self.estaPago() and destino.dejaPasar(mensajero)

  method estaPago() = pagado
  method destino(nuevo){
    destino = nuevo
  }
}

object paquetito{
    method puedeSerEntregado(alguien) = true
    method estaPago() = true
    method precio() = 0
}

object paqueton{
    const destinos = [puente, matrix]
    var pagado = 0
    method puedeSerEntregado(alguien) = self.estaPago() and self.pasaPorTodos(alguien)
    method pasaPorTodos(mensajero) = destinos.all({d=>d.dejaPasar(mensajero)})
    method estaPago() = pagado >= self.precio()
    method precio() = destinos.size() * 100
    method pagar(importe) {
        pagado = pagado + importe
    }

}



object puente{
  method dejaPasar(alguien)= alguien.peso() <= 1000
}

object matrix{
  method dejaPasar(alguien) = alguien.puedeLlamar()

}

object neo{
  var tieneCredito = true
  
  method cargar() {
    tieneCredito = true
  }
  method hablar() {
    tieneCredito = false
  }
  method peso() = 0
  method puedeLlamar() = tieneCredito
}
object chuck{
  method peso() = 80
  method puedeLlamar() = true
}

object roberto{
  const peso = 80
  var vehiculo = bicicleta
  method peso() = peso + vehiculo.peso()
  method puedeLlamar() = false
  method viajaEn(algo){
    vehiculo = algo
  }
}
object bicicleta{
  method peso() = 5
}
object camion{
  var acoplados = 1
  method peso() = acoplados * 500
  method ampliar(){
    acoplados = acoplados + 1
  }
}