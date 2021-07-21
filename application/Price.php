<?php

namespace application;

class Price
{
    public function orderPrice($price_pizza, $coefficient, $price_sauces)
    {
        $price_pizza *= $coefficient;
        $price_sauces *= $coefficient;
        $price = $price_pizza + $price_sauces;
        return [$price_pizza,  $price_sauces, $price];
    }
}
