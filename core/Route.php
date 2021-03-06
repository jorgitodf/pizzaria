<?php

namespace Core;

class Route {

    private $routes;
    
    public function __construct(array $routes) {
        $this->setRoutes($routes);
        $this->run();
    }
    
    private function setRoutes($routes) {
        foreach ($routes as $route) {
            $explode = explode('@', $route[1]);
            $r = [$route[0], $explode[0], $explode[1]];
            $newRoutes[] = $r;
        }
        $this->routes = $newRoutes;
    }
    
    private function getUrl() {
	return parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
    }
    
    private function run() {
        $url = $this->getUrl();
        $urlArray = explode('/', $url);
        
        foreach ($this->routes as $route) {
            $routeArray = explode('/', $route[0]);
            
            $param = [];
            for ($index = 0; $index < count($routeArray); $index++) {
                if ((strpos($routeArray[$index], "{") !== false) && (count($urlArray) == count($routeArray))) {
                    $routeArray[$index] = $urlArray[$index];
                    $param[] = $urlArray[$index];
                }
                $route[0] = implode($routeArray, '/');
            }
            
            if ($url == $route[0]) {
                $encontrada = true;
                $controller = $route[1];
                $acao = $route[2];
                break;
            }
        }
                    
        if ($encontrada) {
            $controller = Container::newController($controller);
            switch(count($param)) {
                case 1:
                    $controller->$acao($param[0]);
                    break;
                case 2:
                    $controller->$acao($param[0], $param[1]);
                    break;
                case 3:
                    $controller->$acao($param[0], $param[1], $param[2]);
                    break;
                default:
                    $controller->$acao();
                    break;
            }
        } else {
            Container::pageNotFound();
        }
    }
    
}
