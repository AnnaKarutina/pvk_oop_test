<?php
require_once 'conf.php';
// loome vajalikud vaade objektid
$mainTmpl = new Template('main');
$contentTmpl = new Template('content');



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

$mainTmpl->set('title', 'Menu App');

foreach ($categories as $category){
    $cardTmpl = new Template('card');
    $cardHeaderTmpl = new Template('header');
    $cardDataTmpl = new Template('data');

    $cardHeaderTmpl->set('category', $category['name']);
    $cardHeaderTmpl->set('icon', $category['icon']);
    $cardTmpl->set('card_header', $cardHeaderTmpl->parse());

    $cardDataTmpl->set('category', $category['name']);
    $listTmpl = new Template('list');
    foreach ($category['data'] as $dish){
        foreach ($dish as $name=>$value){
            $listTmpl->set($name, $value);
        }
        $cardDataTmpl->add('dish_list', $listTmpl->parse());
    }
    $cardTmpl->set('card_data', $cardDataTmpl->parse());

    $contentTmpl->add('cards', $cardTmpl->parse());
}
$mainTmpl->set('content', $contentTmpl->parse());

echo $mainTmpl->parse();

//echo '<pre>';
//print_r($mainTmpl);
//echo '</pre>';