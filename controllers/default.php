<?php
$date = date('Y-m-d');
echo $date;

$categories = $db->getData('SELECT * FROM dish_types');

echo '<pre>';
print_r($categories);
echo '</pre>';

foreach ($categories as $category){
    $cardTmpl = new Template('card');
    $cardHeaderTmpl = new Template('header');
    $cardDataTmpl = new Template('data');

    $cardHeaderTmpl->set('category', $category['type_name']);
    $cardHeaderTmpl->set('icon', $category['type_icon']);
    $cardTmpl->set('card_header', $cardHeaderTmpl->parse());

    $cardDataTmpl->set('category', $category['type_name']);
//    $category['data'] = $db->getData('SELECT * FROM dishes WHERE type_id='.fixDb($category['type_id']));
//    WHERE type_id='.fixDb($category['type_id']).'
//    NATURAL JOIN dishes GROUP BY dish_id');
//    $category['data'] = $db->getData('SELECT * FROM dish_availability WHERE dish_date='.fixDb($date).' LEFT JOIN dishes GROUP BY dish_id' );


    $listTmpl = new Template('list');


    $sql = 'SELECT * from dishes NATURAL JOIN dish_availability, dish_types WHERE dish_availability.dish_date='.fixDb($date).' AND dish_types.type_id=dishes.type_id AND dishes.type_id='.fixDb($category['type_id']);

    echo $sql;

    $category['data'] = $db->getData($sql);

    echo '<pre>';
    print_r($category['data']);
    echo '</pre>';
    echo '<hr>';

    foreach ($category['data'] as $dish){


        foreach ($dish as $name=>$value){
            $listTmpl->set($name, $value);
            $discount = discount($dish['dish_price'], 15);
        }
        if($category['type_name'] != 'joogid') {
            $listTmpl->set('discount', $discount);
        } else {
            $listTmpl->set('discount', $dish['dish_price']);
        }
        $cardDataTmpl->add('dish_list', $listTmpl->parse());
    }
    $cardTmpl->set('card_data', $cardDataTmpl->parse());

    $contentTmpl->add('cards', $cardTmpl->parse());
}

$mainTmpl->set('content', $contentTmpl->parse());