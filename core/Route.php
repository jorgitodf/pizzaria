<?php

namespace Core;

class Route {

    private $routes;
    
    public function __construct(array $routes) {
        $this->setRoutes($routes);
        //$this->run();
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
    
}
