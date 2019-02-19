<?php
require_once 'conf.php';


// loome vajalikud vaade objektid
$mainTmpl = new Template('main');
$contentTmpl = new Template('content');
/*
$categories = array();

$dishTypes = $db->getData('SELECT * FROM dish_types');

foreach ($dishTypes as $dishType){
    $sql = 'SELECT * FROM dishes WHERE type_id='.fixDb($dishType['type_id']);
    $menu =  $db->getData($sql);
    $categories[] = array(
        'name' => $dishType['type_name'],
        'icon' => $dishType['type_icon'],
        'data' => $menu
    );
}

echo '<pre>';
print_r($categories);
echo '</pre>';
*/
/*
$categories = array(
    array(
        'name' => 'praed',
        'icon' => 'fa-utensils',
        'data' => array(
            array(
                'name' => 'Sealihapada ploomide ja aprikoosiga',
                'description' => 'sealihapada, lisand, salat, leib',
                'price' => 2.65,
                'discount' => 2.25
            ),
            array(
                'name' => 'Praetud kanakints',
                'description' => 'praetud kana, lisand, salat, leib',
                'price' => 2.50,
                'discount' => 2.13
            )
        )
    ),
    array(
        'name' => 'supid',
        'icon' => 'fa-utensil-spoon',
        'data' => array(
            array(
                'name' => 'Rassolnik',
                'description' => 'supp, hapukoor, leib',
                'price' => 1.10,
                'discount' => 0.94
            )
        )
    )
);
*/
$mainTmpl->set('title', 'Menu App');

require_once 'controller.php';

echo $mainTmpl->parse();

//echo '<pre>';
//print_r($mainTmpl);
//echo '</pre>';