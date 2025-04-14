CREATE TABLE IF NOT EXISTS public.product_sales
(
    customer        text,
    customer_status text,
    product_code    text,
    quantity        integer,
    license_type    text,
    processed_date  date,
    discount_id     text,
    amount_in_usd   double precision,
    discount_in_usd double precision
);

ALTER TABLE public.product_sales
    OWNER TO jet;
