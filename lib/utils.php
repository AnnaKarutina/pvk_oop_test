<?php
//wrapper function
//teeb ohtlikud märgid ohutu märkideks
//&lt;&gt;&amp;
function fixHtml($val)
{
    return htmlentities($val);
}
//andmebaasi eest varjastamine - pannakse jutumärgid ümber
function fixDb($val)
{
    /*
    global $db;
    return '"'.mysql_real_escape_string($val, $db->conn).'"';
    */
    return '"'.addSlashes($val).'"';
}

function discount($price, $discountProcent){
    return round($price * ((100 - $discountProcent) / 100), 2);
}
?>