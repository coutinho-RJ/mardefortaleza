extends CanvasLayer

func AtualizarBarraVida(Vida):
	var escala= (Vida/ 5)* 119.936
	$barracontainer/barr.scale.X = escala
	pass	
