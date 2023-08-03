-- example
CREATE TABLE public.store_sales
(
    sale_date date NOT NULL,
    day_of_year integer NOT NULL,
    employee_shifts integer,
    units_sold integer,
    revenue integer,
    month_of_year integer
);
