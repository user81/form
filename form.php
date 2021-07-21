<?php

use application\Db;
use application\Price;

require_once "bootstrup.php";


$mysql = new Db();
$pizza_price1 = new Price();
if (isset($_POST['pizza'], $_POST['sauces'], $_POST['size'])) {
    $form = $mysql->stringStmt('SELECT pizza.name AS name_pizza, sauces.name AS name_sauces, 
    pizza.price AS price_pizza, sauces.price AS price_sauces, size.size, size.coefficient FROM pizza 
    INNER JOIN `pizza-description` ON `pizza-description`.pizza_id = pizza.id 
    INNER JOIN sauces ON `pizza-description`.sauces_id = sauces.id 
    INNER JOIN size ON `pizza-description`.size_id = size.id 
    WHERE pizza.id = ? AND sauces.id = ? AND size.id = ? ', [$_POST['pizza'], $_POST['sauces'], $_POST['size']]);
    $price = $pizza_price1->orderPrice($form['price_pizza'], $form['coefficient'], $form['price_sauces']);
} ?> 
<div class="alert alert-success" role="alert"> 
  <h4 class="alert-heading">Чек</h4> 
  <p>Пица <?php echo $_POST['pizza'] . ": " . $price[0]?> </p> 
  <p>Соус <?php echo $_POST['sauces'] . ": " . $price[1]?> </p> 
  <hr> <p class="mb-0">Общая цена: <?php echo $price[2]?></p> 
</div> 