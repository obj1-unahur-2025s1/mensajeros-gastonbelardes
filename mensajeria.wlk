import mensajeros.*

object empresa{
   const mensajeros = [chuck, roberto, neo]
   const enviados = []
   const pendientes = []

//Contratar a un mensajero
    method contratar(empleado){
        mensajeros.add(empleado)
    }
//Despedir a un mensajero
    method despedir(alguien){
        mensajeros.remove(alguien)
    }
//Despedir a todos los mensajeros
   method despedirTodos(){
    mensajeros.clear()
   }
//Analizar si la mensajeria es grande (si tiene mas de dos mensajeros)
    method esGrande() = mensajeros.size() > 2
//Consultar si el paquete puede ser entregado por el primer empleado de la la empresa de mensajería.
  method entregaRapida() = paquete.puedeSerEntregado(mensajeros.head())
//Saber el peso del último mensajero de la empresa.
  method pesoFinal() = mensajeros.last().peso()
//Hacer al menos un test por cada punto de los anteriores que demuestren su correcto funcionamiento.
//tercera parte

    method puedeEntregar(unPaquete) =
        mensajeros.any{m => unPaquete.puedeSerEntregado(m)}

    method quienesPuedenEntregar(unPaquete) =
        mensajeros.filter{m => unPaquete.puedeSerEntregado(m)}

    method tieneSobrepeso() = self.pesoTotal() / self.cantidadMensajeros() > 500 

    method cantidadMensajeros() = mensajeros.size()

    method pesoTotal() = mensajeros.sum({m=> m.peso()})

    method enviar(unPaquete) {
        if (self.puedeEntregar(unPaquete)) {
            enviados.add(unPaquete)
        }
    }

    method facturacion() = enviados.sum({p=> p.precio()})

    method enviarTodos(paquetesAEnviar) {
        paquetesAEnviar.each({p=> self.enviar(p)})
    }

    method reenviarPendienteCaro() {
        const caro = self.pendienteCaro()
        pendientes.remove(caro)
        self.enviar(self.pendienteCaro())
    }

    method pendienteCaro() = pendientes.max{p=>p.precio()}
}