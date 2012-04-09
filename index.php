<?php
include 'Twig/Autoloader.php';
Twig_Autoloader:register();

try {
	$loader = new Twig_Loader_Filesysytem('templates');
	$twig = new Twig_Environment($loader);

	$template = $twig.loadTemplate('index.tpl');

	echo $template->render(array(
	));
} catch (Exception $e) {
	die('ERROR: ' . $e->getMessage());
}
