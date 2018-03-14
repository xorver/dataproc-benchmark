#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""This script generates sales, waste and stock for given calendar, product, and store data"""

import random

dir_name = 'csv'
stock_min = 1000
stock_max = 2000
sales_min = 0
sales_max = 100
waste_min = 0
waste_max = 100
delivery_min = 0
delivery_max = 200


def read_data(table_name):
    with open(dir_name + '/{0}/{0}.csv'.format(table_name)) as f:
        return [line[:-1].split(",") for line in f.readlines()]


def write_data(table_name, data):
    with open(dir_name + '/{0}/{0}.csv'.format(table_name), "w") as f:
        f.writelines(["{0},{1},{2},{3}\n".format(pr, st, day, str(value)) for (pr, st, day, value) in data])


calendar = read_data('calendar')
product = read_data('product')
store = read_data('store')

previous_stock = dict()
for st in store:
    for pr in product:
        previous_stock[(st[0], pr[0])] = random.randrange(stock_min, stock_max)

daily_sales = []
daily_stock = []
daily_waste = []
for [day] in calendar:
    for st in store:
        for pr in product:
            sales = random.randrange(sales_min, sales_max)
            waste = random.randrange(waste_min, waste_max)
            stock = previous_stock[(st[0], pr[0])] - sales - waste + random.randrange(delivery_min, delivery_max)
            previous_stock[(st[0], pr[0])] = stock
            daily_sales.append((pr[0], st[0], day, sales))
            daily_stock.append((pr[0], st[0], day, stock))
            daily_waste.append((pr[0], st[0], day, waste))

write_data('daily_sales', daily_sales)
write_data('daily_stock', daily_stock)
write_data('daily_waste', daily_waste)
