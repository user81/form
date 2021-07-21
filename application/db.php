<?php

namespace application;

use application\Connection;
use PDO;

require_once('../bootstrup.php');

class Db extends Connection
{
    public function __construct()
    {
        $host = 'localhost';
        $name = 'pizza-form';
        $user = 'root';
        $password = '';
        $this->db = new PDO('mysql:host=' . $host . ';dbname=' . $name . '', $user, $password);
    }

    public function queryFun($sql, $arreyVal = [])
    {
        $result = $this->db->prepare($sql);
        $result->execute($arreyVal);
        return $result->fetchAll();
    }

    public function stringStmt($sql, $arreyVal)
    {
        $result = $this->db->prepare($sql);
        $result->execute($arreyVal);
        return $result->fetch();
    }
}
