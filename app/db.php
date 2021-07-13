<?php
abstract class Connection
{
	public $db;
	abstract function __construct();
}

class Db extends Connection
{

	public function __construct()
	{
		$config = [
			'host'    =>  'localhost',
			'name'    =>  'pizza-form',
			'user' =>  'root',
			'password' =>  '',
		];

		$this->db = new PDO('mysql:host=' . $config['host'] . ';dbname=' . $config['name'] . '', $config['user'], $config['password']);
	}

	public function queryFun($sql)
	{
		$result = $this->db->query($sql);
		return $result->fetchAll();
	}

	public function stringStmt($sql, $arreyVal)
	{
		$result = $this->db->prepare($sql);
		$result->execute($arreyVal);
		return $result->fetch();
	}
}

