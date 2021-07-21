<?php

namespace application;

abstract class Connection
{
    public $db;
    abstract public function __construct();
}
