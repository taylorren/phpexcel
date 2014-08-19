<?php

error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);


require_once 'vendor/autoload.php';
require_once 'classExcel.php';


$app=new Silex\Application();
$app['debug']=true;


$app->register(new Silex\Provider\TwigServiceProvider(), array(
	'twig.path'=>'views',
));

$app->get('/', function () use ($app)
{
    $c=new trExcel\Excel();
    return $c->index($app);
});

$app->post('/export', function () use ($app)
{
    $c=new trExcel\Excel();
    return $c->export($app);
});

$app->run();

