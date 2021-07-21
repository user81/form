<?php

use application\Db;

require_once "bootstrup.php"
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title></title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
</head>

<body>
  <script>
  function sendForm() {
    jQuery.ajax({
      url: "form.php",
      data: 'pizza=' + $("#pizza").val() + '&sauces=' + $("#sauces").val() + '&size=' + $("#size").val(),
      type: "POST",
      success: function(data) {
        $("#card").html(data);
      },
      error: function() {}
    });
  }
  </script>
  <?php $sql = new Db();
    $pizza_list = $sql->queryFun('SELECT `id`, `name` FROM `pizza`');
    $sauces_list = $sql->queryFun('SELECT `id`, `name` FROM `sauces`');
    $size_list = $sql->queryFun('SELECT `id`, `size` FROM `size`'); ?>

  <div class="container">
    <div class="row g-3">
      <div id="card"></div>
      <div class="col-12"> <label for="pizza" class="form-label">pizza</label> <select id="pizza" class="form-select"
          name="pizza"> <?php foreach ($pizza_list as $pizza) {
                ?> <option value="<?php echo $pizza['id'] ?>">
                <?php echo $pizza['name']; ?></option> <?php
                        } ?> </select> </div>
      <div class="col-12"> <label for="sauces" class="form-label">sauces</label> <select id="sauces" class="form-select"
          name="sauces"> <?php foreach ($sauces_list as $sauces) {
                ?> <option value="<?php echo $sauces['id'] ?>">
                <?php echo $sauces['name']; ?></option> <?php
                         } ?> </select> </div>
      <div class="col-12"> <label for="size" class="form-label">size</label> <select id="size" class="form-select"
          name="size"> <?php foreach ($size_list as $size) {
                ?> <option value="<?php echo $size['id'] ?>">
                <?php echo $size['size']; ?></option> <?php
                       } ?> </select> </div>
      <div class="col-12"> <button type='submit' name='submit' value='Submit' class="btn btn-outline-primary"
          onClick="sendForm();">заказать</button> </div>
    </div>
  </div>
</body>

</html>