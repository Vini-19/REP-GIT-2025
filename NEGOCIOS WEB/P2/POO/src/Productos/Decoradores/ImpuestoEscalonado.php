<?

namespace Nws\Productos\Decoradores;

class ImpuestoEscalonado extends ADecorador
{

    private array $escalones;
    public function __construct(array $escalones, string $name)
    {
        foreach ($escalones as $escalon) {
            if (count($escalon) != 2) {
                throw new \Exception("Escalon [[techo, porcentaje -1, 1]]...");
            }
            if (!is_numeric($escalon[0]) && $escalon[0] <= 0) {
                throw new \Exception("Techo debe ser un numerico y mayor a 0");
            }
            if (!is_numeric($escalon[1]) && $escalon[0] >= -1 && $escalon[0] <= 1) {
                throw new \Exception("Valore debe ser numérico y entre -1 y 1");
            }
        }
        $this->escalones = $escalones;
        parent::__construct(0, "Impuesto", EtipoOperacion::SumaValor);
    }

    public function getPrecio(float $precioBase, float $precioActual)
    {
        $impuesto = 0;
        $techoAnterior = 0;
        foreach ($this->escalones as $escalon) {
            $techo = $escalon[0];
            $prct = $escalon[1];
            if ($precioActual > $techo) {
                $impuesto += $techo * $prct;
            } else {
                $impuesto += ($precioActual - $techoAnterior) * $prct;
                break;
            }
            $techoAnterior = $techo;
        }
        return $impuesto;
    }
}